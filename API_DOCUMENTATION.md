# API Documentation
> Mathify JAX-RS API, Base URL: `/api`, Version: v1

## Table of Contents
- [Overview](#overview)
- [Error Responses](#error-responses)
- [Endpoints](#endpoints)
  - [AuthResource](#authresource)
  - [CourseResource](#courseresource)
  - [QuizResource](#quizresource)

## Overview
- **Base URL:** `http://localhost:8080/api` (or relative `/api` on the server)
- **Authentication method:** Token/Session based. Endpoints marked as `@Secured` require an authenticated context (typically via server session established after `/auth/login`).
- **Common headers:** `Content-Type: application/json`, `Accept: application/json`

## Error Responses
The API uses standardized error responses across all endpoints.

**Success format:** `200 OK` or `201 Created` depending on the operation.
**Error format:** `ErrorResponse` object.

```json
{
  "error": "Validation Failed",
  "details": "idToken is required"
}
```

**Common HTTP Status Codes:**
| Status | Condition |
|--------|-----------|
| `400`  | Validation failed (e.g., missing required fields handled by `@Valid`) |
| `401`  | Unauthorized (Missing or invalid authentication) |
| `404`  | Resource not found |
| `500`  | Internal Server Error |

---

## Endpoints

### AuthResource
Authentication and session management.

#### `POST /api/auth/login`
**Description:** Authenticates a user using an identity token (e.g., Firebase ID token) and establishes a session.

**Authentication:** Not Required

**Request Body:**
```json
{
  "idToken": "eyJhbGciOiJSUzI1NiIs..."
}
```

**Request Body Fields:**
| Field     | Type   | Required | Validation        | Description |
|-----------|--------|----------|-------------------|-------------|
| idToken   | String | Yes      | NotBlank          | Identity token for login |

**Response — Success:**
- Status: `200 OK`
```json
{
  "role": "STUDENT",
  "message": "Login successful"
}
```

**Response — Error:**
| Status | Condition              |
|--------|------------------------|
| 400    | `idToken` is missing or blank |
| 401    | Invalid or expired token |

**Example cURL:**
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"idToken": "YOUR_FIREBASE_ID_TOKEN"}'
```

#### `POST /api/auth/logout`
**Description:** Logs the user out and invalidates the session.

**Authentication:** Not Required

**Response — Success:**
- Status: `200 OK`
```json
{
  "message": "Logged out"
}
```

**Example cURL:**
```bash
curl -X POST http://localhost:8080/api/auth/logout \
  -H "Content-Type: application/json"
```

---
### CourseResource
Retrieve course catalog and details.

#### `GET /api/courses`
**Description:** Retrieves a list of all course summary cards for the library grid.

**Authentication:** Not Required

**Response — Success:**
- Status: `200 OK`
```json
[
  {
    "id": "c-k2",
    "title": "Early Elementary Math (K-2)",
    "description": "Early Math curriculum",
    "track": "Early Math",
    "level": "Beginner",
    "levelNum": 1,
    "color": "green",
    "glyph": "∑",
    "totalLessons": 9,
    "estimatedHours": "5h",
    "xpReward": 1000,
    "status": "new"
  }
]
```

**Example cURL:**
```bash
curl -X GET http://localhost:8080/api/courses \
  -H "Accept: application/json"
```

#### `GET /api/courses/{id}`
**Description:** Retrieves the full details of a specific course, including its prerequisites and chapters.

**Authentication:** Required (`@Secured`)

**Path Parameters:**
| Parameter | Type   | Required | Description |
|-----------|--------|----------|-------------|
| id        | String | Yes      | Course ID |

**Response — Success:**
- Status: `200 OK`
```json
{
  "courseId": "c-k2",
  "title": "Early Elementary Math (K-2)",
  "description": "Early Math curriculum",
  "category": "Early Math",
  "prerequisite": [],
  "chapters": [
    {
      "chapterId": "ch-k2-u1",
      "title": "Counting and Cardinality"
    }
  ]
}
```

**Response — Error:**
| Status | Condition              |
|--------|------------------------|
| 401    | Unauthorized (Session missing or invalid) |
| 404    | Course not found       |

**Example cURL:**
```bash
curl -X GET http://localhost:8080/api/courses/c-k2 \
  -H "Accept: application/json" \
  -H "Cookie: JSESSIONID=YOUR_SESSION_ID"
```

---
### QuizResource
Retrieve quiz details and exercises.

#### `GET /api/quizzes/{id}`
**Description:** Retrieves a specific quiz and all of its associated questions.

**Authentication:** Required (`@Secured`)

**Path Parameters:**
| Parameter | Type   | Required | Description |
|-----------|--------|----------|-------------|
| id        | String | Yes      | Quiz ID |

**Response — Success:**
- Status: `200 OK`
```json
{
  "quizId": "q-l-k2-u1-1",
  "title": "Exercises: Counting to 10",
  "passingScore": 2,
  "questions": [
    {
      "questionId": "q-0-98183fcd",
      "prompt": "If you have 4 apples and 3 bananas, how many fruits do you have in total?",
      "points": 10,
      "type": "MULTIPLE_CHOICE"
    }
  ]
}
```

**Response — Error:**
| Status | Condition              |
|--------|------------------------|
| 401    | Unauthorized (Session missing or invalid) |
| 404    | Quiz not found         |

**Example cURL:**
```bash
curl -X GET http://localhost:8080/api/quizzes/q-l-k2-u1-1 \
  -H "Accept: application/json" \
  -H "Cookie: JSESSIONID=YOUR_SESSION_ID"
```

---

## ⚠️ Session cookie requirement (auth fix)

The frontend talks to the backend **same-origin** through a Next.js proxy (`/api/*` → backend), so the session cookie set by `POST /api/auth/login` must be storable by the browser on the proxy origin.

**Problem observed:** every response currently sends `Access-Control-Allow-Origin: *` together with `Access-Control-Allow-Credentials: true` (an invalid CORS combination) — indicating the session cookie is issued for cross-site use, i.e. `Set-Cookie: …; SameSite=None; Secure`. A `Secure` cookie is **dropped by the browser over `http://localhost`**, so the session never persists and every `@Secured` call 401s right after login.

**Frontend mitigation (already shipped):** `app/api/auth/login/route.ts` proxies the login and rewrites the backend's `Set-Cookie` (strips `Secure` over http, downgrades `SameSite=None`→`Lax`, drops `Domain`) so the session sticks in dev.

**Recommended backend fix:** in non-HTTPS/dev profiles, issue the session cookie as `Set-Cookie: JSESSIONID=…; Path=/; HttpOnly; SameSite=Lax` (no `Secure`). For production over HTTPS, `SameSite=None; Secure` is fine since the proxy is same-origin. Also drop the `Access-Control-Allow-Origin: *` + `Allow-Credentials: true` combo (use a concrete allowed origin, or omit CORS entirely now that calls are same-origin).

---

# Proposed Endpoints (to implement)
> Drafted by the frontend; not yet implemented. The client already consumes these with graceful fallback. Shapes can be adjusted — update `core/api.ts` to match.

### MeResource (extend existing `GET /api/me`)
Add billing/subscription fields to the current `Me` payload so premium status can be shown in the nav, profile menu, and Plans page.

```jsonc
{
  "name": "Ada Lovelace",
  "initial": "A",
  "streak": 12,
  "xp": 2480,
  "level": 8,
  "plan": "ANNUAL",            // "FREE" | "MONTHLY" | "ANNUAL"  (NEW)
  "premium": true,              // convenience flag, true for any paid plan (NEW)
  "planRenewsAt": "2026-12-01T00:00:00Z"  // ISO-8601, null on FREE (NEW)
}
```
If `premium` is omitted, the client derives it as `plan !== "FREE"`.

### DashboardResource — `GET /api/me/dashboard`
**Auth:** Required (`@Secured`). One aggregate feed backing the Today page. Every section is rendered with a static fallback until this ships, so partial rollouts are safe.

```jsonc
{
  "goal": { "targetXp": 50, "earnedXp": 36 },
  "continueLearning": {                 // null when nothing is in progress
    "courseId": "ab16…", "courseTitle": "Differential Calculus", "track": "Calculus", "level": 8,
    "chapterId": "ch-…", "chapterTitle": "Derivatives",
    "lessonId": "l-…",   "lessonTitle": "The chain rule, intuitively",
    "lessonDescription": "Functions inside functions — a nested gear system.",
    "stepIndex": 3, "stepCount": 7,     // stepIndex is 1-based
    "progressPercent": 43, "xpReward": 24, "estimatedMinutes": 6,
    "pausedAt": "2026-06-17T03:10:00Z"  // ISO-8601 or null
  },
  "upNext": [
    { "id": "s1", "type": "PRACTICE", "title": "Practice: chain rule drills", "meta": "8 problems · 12 XP", "xp": 12 }
    // type: "LESSON" | "PRACTICE" | "VIDEO" | "QUIZ"
  ],
  "streak":   { "current": 12, "history": [3,4,3,5,6,5,7,6,8,7,9,8,9,10] },  // intensity per day, oldest→newest
  "weeklyXp": { "days": [180,240,220,320,300,460,520], "total": 2480, "deltaPercent": 12 },
  "hearts":   { "current": 5, "max": 5 },
  "quests": [
    { "id": "q1", "scope": "DAILY", "title": "Finish today's plan", "description": "Complete the 3 remaining steps",
      "progress": 4, "total": 7, "reward": "20 XP", "color": "green" }   // color: green|blue|amber|plum|rose (optional)
  ],
  "achievements": {
    "earnedCount": 12,
    "recent":   [ { "id": "a1", "name": "Algebra Apprentice", "description": "Finished Basic Algebra",
                    "earnedAt": "2026-06-15T12:00:00Z", "color": "green", "glyph": "" } ],  // earnedAt ISO or humanized
    "upcoming": [ { "id": "u1", "name": "Calculus Cadet", "requirement": "Finish Derivatives" } ]
  }
}
```

### ChapterResource — `GET /api/chapters/{chapterId}/lessons`
**Auth:** Required (`@Secured`). Lessons within a chapter, backing the chapter modules page. Falls back to a placeholder note until live.

```jsonc
{
  "chapterId": "ch-k2-u1",
  "title": "Counting and Cardinality",
  "lessons": [
    { "id": "l-1", "title": "Counting to 10", "type": "READING",  // READING|VIDEO|PRACTICE|QUIZ
      "estimatedMinutes": 6, "xpReward": 24, "status": "COMPLETED" } // LOCKED|AVAILABLE|IN_PROGRESS|COMPLETED
  ],
  "quizId": "q-l-k2-u1-1"   // end-of-chapter quiz id, or null
}
```

### QuizResource — answer options + grading
**1. Add `options` to each question on `GET /api/quizzes/{id}`** (correctness never exposed pre-grade):
```jsonc
{
  "questionId": "q-0-98183fcd", "prompt": "…", "points": 10, "type": "MULTIPLE_CHOICE",
  "options": [ { "id": "o-a", "text": "7" }, { "id": "o-b", "text": "12" } ]   // NEW
}
```
The quiz renders read-only until every question carries `options`; then it becomes interactive.

**2. `POST /api/quizzes/{id}/attempts`** — grade a submission. **Auth:** Required.

**Request:**
```jsonc
{ "answers": [ { "questionId": "q-0-98183fcd", "optionId": "o-a" } ] }
```
**Response — `200 OK`:**
```jsonc
{
  "score": 20, "totalPoints": 30, "correctCount": 2, "questionCount": 3,
  "passed": true, "passingScore": 2,
  "results": [
    { "questionId": "q-0-98183fcd", "correct": true, "earnedPoints": 10, "correctOptionId": "o-a" }
  ]
}
```

### CourseResource — `POST /api/courses/{id}/enroll`
**Auth:** Required. Enrolls the current student; returns the created enrollment (same shape as `GET /api/students/me/enrollments` items). Used by the All Courses "Enroll" button.
- `201 Created`: `{ "courseId": "c-k2", "status": "NOT_STARTED", "lastAccessedAt": null, "progressPercent": 0 }`
- `401` not signed in · `404` course not found · `409` already enrolled (treated as success by the client).

### NotificationResource — `GET /api/me/notifications`
**Auth:** Required (best-effort on the client; empty/401 → empty bell).
```jsonc
{
  "unread": 2,
  "items": [
    { "id": "n1", "title": "New badge unlocked", "body": "Algebra Apprentice", "icon": "Trophy",  // Icon key
      "link": "/dashboard", "read": false, "createdAt": "2026-06-17T02:00:00Z" }
  ]
}
```
- `POST /api/me/notifications/{id}/read` — mark one read.
- `POST /api/me/notifications/read-all` — mark all read.

### BillingResource — `POST /api/billing/checkout`
**Auth:** Required. Starts a Midtrans checkout for a paid plan. The Plans CTA redirects the browser to `redirectUrl` (falls back to a "coming soon" toast on error).

**Request:** `{ "planId": "ANNUAL" }`  → **Response:** `{ "redirectUrl": "https://app.midtrans.com/snap/…", "token": "…", "orderId": "…" }`

### Still static (no contract yet)
- Admin dashboard, and lesson-detail content (the lessons feed above lists steps but there's no per-lesson reading/video payload route yet).


# Admin CRUD API — Proposal

> Proposed contract for the Mathify admin console. Base URL `/api`, version v1.
> **Status: PROPOSAL** — frontend is built against this; backend to implement.
> Companion to [API_DOCUMENTATION.md](API_DOCUMENTATION.md) (existing read endpoints).

## Table of Contents
- [Conventions](#conventions)
- [Authorization](#authorization)
- [Open questions for the backend team](#open-questions-for-the-backend-team)
- [Courses](#courses)
- [Chapters](#chapters)
- [Quizzes](#quizzes)
- [Questions](#questions)

## Conventions
- **Content negotiation:** `Content-Type: application/json`, `Accept: application/json`.
- **Auth:** session cookie (`JSESSIONID`) established by `POST /api/auth/login`. All
  endpoints below are `@Secured` and additionally require the `ADMIN` role.
- **IDs:** server-generated and returned in the create response body. The client
  never invents IDs. Existing IDs are human-readable slugs (`c-k2`, `ch-k2-u1`,
  `q-l-k2-u1-1`); the server may keep that scheme or switch to opaque IDs — the
  frontend treats every ID as an opaque string.
- **Timestamps:** ISO-8601 (`2026-06-17T08:30:00Z`) where present.
- **Errors:** reuse the existing `ErrorResponse` shape and status codes from
  [API_DOCUMENTATION.md](API_DOCUMENTATION.md#error-responses). Relevant additions:

  | Status | Condition |
  |--------|-----------|
  | `403`  | Authenticated but not an `ADMIN` |
  | `409`  | Conflict — e.g. deleting a course that still has chapters, or a duplicate slug |

## Authorization
`POST /api/auth/login` already returns `role`. The admin console only renders for
`role === "ADMIN"`; the server must still enforce the role on every mutation
(never trust the client). A non-admin session hitting these endpoints gets `403`.

## Open questions for the backend team
1. **`track` vs `category`.** The course *summary* exposes `track`, the course
   *detail* exposes `category`. The create/update body below sends a single
   `category` and assumes the server derives `track` from it. Confirm or split.
2. **`totalLessons`** is treated as **server-computed** (count of chapters /
   lessons) and is therefore *not* accepted in the create/update body.
3. **Question answer options.** The current read API (`GET /api/quizzes/{id}`)
   returns `prompt/points/type` but **no options**. Authoring requires options +
   which one is correct. This proposal adds an `options[]` array to the question
   body, and asks that the admin-authenticated `GET` include `options` (with the
   `correct` flag) so the edit form can prefill. The student-facing response must
   keep hiding the `correct` flag.
4. **Cascade vs block on delete.** Default proposed: deleting a parent that still
   has children returns `409` (block). If you prefer cascade delete, say so and
   the confirm dialog copy will change accordingly.

---

## Courses

### `POST /api/courses`
Create a course.

**Request Body** (`CourseInput`):
```json
{
  "title": "Early Elementary Math (K-2)",
  "description": "Early Math curriculum",
  "category": "Early Math",
  "level": "Beginner",
  "levelNum": 1,
  "color": "green",
  "glyph": "∑",
  "estimatedHours": "5h",
  "xpReward": 1000,
  "status": "new",
  "prerequisite": []
}
```

| Field          | Type     | Required | Validation / Notes |
|----------------|----------|----------|--------------------|
| title          | String   | Yes      | NotBlank |
| description    | String   | Yes      | NotBlank |
| category       | String   | Yes      | Maps to summary `track` (see open question 1) |
| level          | String   | Yes      | e.g. `Beginner` / `Intermediate` / `Advanced` |
| levelNum       | Integer  | Yes      | >= 1 |
| color          | String   | Yes      | One of `green` `blue` `plum` `amber` `rose` |
| glyph          | String   | No       | Single display glyph |
| estimatedHours | String   | No       | Free text, e.g. `5h` |
| xpReward       | Integer  | No       | >= 0, default 0 |
| status         | String   | No       | `new` / `active` / `draft`, default `draft` |
| prerequisite   | String[] | No       | Array of existing course IDs |

**Response — `201 Created`:** the full `CourseDetail` (as in the read API) plus
the generated `courseId`. `totalLessons` starts at 0.

| Status | Condition |
|--------|-----------|
| 400 | Validation failed |
| 403 | Not an admin |
| 409 | Prerequisite course ID does not exist / duplicate slug |

### `PUT /api/courses/{courseId}`
Update a course. Body is the same `CourseInput` (full replace). Returns
`200 OK` with the updated `CourseDetail`. `404` if not found.

### `DELETE /api/courses/{courseId}`
Delete a course. `204 No Content` on success. `404` if not found. `409` if it
still has chapters (unless cascade is chosen — see open question 4).

---

## Chapters
Chapters belong to a course. The existing `GET /api/courses/{courseId}` already
returns the `chapters[]` array, so the admin console reuses it to **list**
chapters — no new GET needed.

### `POST /api/courses/{courseId}/chapters`
**Request Body** (`ChapterInput`):
```json
{ "title": "Counting and Cardinality", "order": 1 }
```

| Field | Type    | Required | Notes |
|-------|---------|----------|-------|
| title | String  | Yes      | NotBlank |
| order | Integer | No       | Display position; server may auto-append if omitted |

**Response — `201 Created`:**
```json
{ "chapterId": "ch-k2-u1", "title": "Counting and Cardinality", "order": 1 }
```
`404` if the course does not exist.

### `PUT /api/courses/{courseId}/chapters/{chapterId}`
Update a chapter. Body = `ChapterInput`. `200 OK` with the updated chapter.

### `DELETE /api/courses/{courseId}/chapters/{chapterId}`
`204 No Content`. `409` if the chapter still has quizzes (unless cascade).

---

## Quizzes
Quizzes belong to a chapter.

### `GET /api/chapters/{chapterId}/quizzes`  *(new — list)*
Lists the quizzes in a chapter (summary form, no questions):
```json
[
  { "quizId": "q-l-k2-u1-1", "title": "Exercises: Counting to 10", "passingScore": 2, "questionCount": 5 }
]
```

> `GET /api/quizzes/{id}` (existing) still returns a single quiz **with**
> `questions[]`. For an admin session it must additionally include each
> question's `options[]` with `correct` flags (see Questions below).

### `POST /api/chapters/{chapterId}/quizzes`
**Request Body** (`QuizInput`):
```json
{ "title": "Exercises: Counting to 10", "passingScore": 2 }
```

| Field        | Type    | Required | Notes |
|--------------|---------|----------|-------|
| title        | String  | Yes      | NotBlank |
| passingScore | Integer | Yes      | >= 0 |

**Response — `201 Created`:** the created quiz (with empty `questions[]`).
`404` if the chapter does not exist.

### `PUT /api/quizzes/{quizId}`
Update quiz metadata (title, passingScore). Body = `QuizInput`. `200 OK`.

### `DELETE /api/quizzes/{quizId}`
`204 No Content`. Deletes the quiz and its questions.

---

## Questions
Questions belong to a quiz.

### `POST /api/quizzes/{quizId}/questions`
**Request Body** (`QuestionInput`):
```json
{
  "prompt": "If you have 4 apples and 3 bananas, how many fruits in total?",
  "points": 10,
  "type": "MULTIPLE_CHOICE",
  "options": [
    { "text": "7", "correct": true },
    { "text": "1", "correct": false },
    { "text": "12", "correct": false },
    { "text": "43", "correct": false }
  ]
}
```

| Field    | Type             | Required | Validation / Notes |
|----------|------------------|----------|--------------------|
| prompt   | String           | Yes      | NotBlank |
| points   | Integer          | Yes      | >= 0 |
| type     | String           | Yes      | `MULTIPLE_CHOICE` (only type for now) |
| options  | Option[]         | Yes\*    | Required for `MULTIPLE_CHOICE`; >= 2 options, exactly 1 with `correct: true` |

**Option** = `{ "text": String (NotBlank), "correct": Boolean }`.

**Response — `201 Created`:** the created question including its generated
`questionId` and the `options[]` (with `correct`). `404` if the quiz is missing.

### `PUT /api/quizzes/{quizId}/questions/{questionId}`
Update a question. Body = `QuestionInput` (full replace, including options).
`200 OK` with the updated question.

### `DELETE /api/quizzes/{quizId}/questions/{questionId}`
`204 No Content`. `404` if not found.

---

## Endpoint summary

| Method | Path | Purpose |
|--------|------|---------|
| POST   | `/api/courses` | Create course |
| PUT    | `/api/courses/{courseId}` | Update course |
| DELETE | `/api/courses/{courseId}` | Delete course |
| POST   | `/api/courses/{courseId}/chapters` | Create chapter |
| PUT    | `/api/courses/{courseId}/chapters/{chapterId}` | Update chapter |
| DELETE | `/api/courses/{courseId}/chapters/{chapterId}` | Delete chapter |
| GET    | `/api/chapters/{chapterId}/quizzes` | List quizzes in chapter |
| POST   | `/api/chapters/{chapterId}/quizzes` | Create quiz |
| PUT    | `/api/quizzes/{quizId}` | Update quiz |
| DELETE | `/api/quizzes/{quizId}` | Delete quiz |
| POST   | `/api/quizzes/{quizId}/questions` | Create question |
| PUT    | `/api/quizzes/{quizId}/questions/{questionId}` | Update question |
| DELETE | `/api/quizzes/{quizId}/questions/{questionId}` | Delete question |

> Existing reads reused by the admin console: `GET /api/courses`,
> `GET /api/courses/{id}` (chapters list), `GET /api/quizzes/{id}` (questions list).

