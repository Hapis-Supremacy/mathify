# CLAUDE.md — Mathify

This file gives Claude (and other AI assistants) context about the Mathify project so it can provide accurate, consistent help.

---

## Project Overview

Mathify is a web-based math learning platform with gamification. It targets students who want structured math courses (Basic Math, Calculus, Linear Algebra, etc.) delivered in an engaging, progression-based format. Think Duolingo mechanics combined with a more formal academic curriculum.

Built as an academic project by Hapis Supremacy at Telkom University.

---

## Architecture

- **Pattern:** REST API (JAX-RS resources → service layer → DAO → JDBC)
- **Backend:** Jakarta EE on the full Web Profile — **JAX-RS** for endpoints, **CDI** for wiring, **Bean Validation** for request DTOs (no Spring)
- **View layer:** JSP for the marketing/landing pages; the app shell is a Vite/React frontend that consumes the REST API
- **Database:** PostgreSQL (via JDBC, no ORM)
- **Build:** Maven, packaged as `.war`
- **Runtime:** **WildFly 31** inside Docker (a full Jakarta EE server — provides JAX-RS, CDI and Bean Validation that plain Tomcat does not)

The project migrated from a Servlet+JSP MVC app to a REST API. Wiring is done with **CDI** (`@Inject`, `@ApplicationScoped`) — DAOs and services are CDI beans; `beans.xml` uses `bean-discovery-mode="annotated"`.

### REST conventions

- **Resources** live in `com.mathify.rest` (`@Path`, auto-discovered — `RestApplication` is `@ApplicationPath("/api")`, so everything is under `/api`).
- **Services** (`com.mathify.service`, `@ApplicationScoped`) hold business logic; resources stay thin.
- **DAOs** (`com.mathify.dao`, `@ApplicationScoped`) do JDBC via `QueryHelper`.
- **DTOs** in `com.mathify.rest.dto.{request,response}` — request DTOs are validated with `@Valid`; responses are records/POJOs serialized by JSON-B. Do **not** hand-build JSON with `org.json` in new code.
- **Auth:** session-based. `AuthService.login` verifies a Firebase token and stores `authUser` (and `admin`) on the `HttpSession`. Protect endpoints with the `@Secured` annotation (enforced by `AuthenticationFilter`); read the current user via `Sessions.currentUser(request)`.
- **Errors** are mapped centrally by `GlobalExceptionMapper` / `ValidationExceptionMapper` to `ErrorResponse` JSON.

---

## Naming Conventions

Follow standard idiomatic Java:

- **Classes:** `PascalCase` — e.g., `CourseServlet`, `UserDao`, `LessonService`
- **Methods & variables:** `camelCase` — e.g., `getUserById()`, `lessonCount`
- **Constants:** `UPPER_SNAKE_CASE` — e.g., `MAX_STREAK_DAYS`
- **Packages:** all lowercase, dot-separated — e.g., `com.mathify.dao`
- **Database tables:** `snake_case` — e.g., `user_progress`, `course_lesson`
- **JSP files:** `kebab-case` or `camelCase` are both fine, be consistent within a feature
- **JAX-RS resources:** `XxxResource` (e.g. `CourseResource`); **services:** `XxxService`; **DAOs:** `XxxDAO`; **DTOs:** `XxxRequest` / `XxxResponse`

---

## Database

- **DBMS:** PostgreSQL 16
- **Connection:** JDBC, managed manually via a `DBConnection` utility class
- **Naming:** tables and columns in `snake_case`
- Do not use an ORM (no Hibernate, no JPA) unless the team explicitly decides to add one
- SQL scripts go in `src/main/resources/sql/`

---

## Build & Run

```bash
# Run with Docker (preferred) — builds the WAR and deploys to WildFly
docker compose up --build -d

# Build WAR locally (requires the frontend/ Vite project — see note below)
./mvnw package -DskipTests

# Compile Java only, without the frontend npm build (fast inner loop)
./mvnw compiler:compile
```

Multi-stage Docker build — the Maven build (including the `frontend/` Vite bundle) happens inside Docker, then the WAR is deployed to WildFly 31 as `ROOT.war`. No pre-built WAR needed.

> **Build note:** `frontend-maven-plugin` runs an `npm` build against a `frontend/`
> Vite project during `mvn package`. A full `package` (and `docker compose up --build`)
> will fail unless that `frontend/` directory is present. For backend-only work,
> use `./mvnw compiler:compile` to skip the frontend step.

---

## Dependencies (pom.xml)

Key dependencies and their intended scopes:

| Dependency | Scope | Reason |
|---|---|---|
| `jakarta.jakartaee-web-api` | `provided` | Jakarta EE Web Profile (Servlet, JAX-RS, CDI, Bean Validation) — WildFly provides it at runtime |
| `postgresql` (JDBC driver) | `compile` | Bundled in WAR |
| `firebase-admin` | `compile` | Firebase token verification; also pulls in `org.json` transitively |
| `slf4j-api` | `compile` | Logging facade |
| `junit-jupiter` | `test` | Unit testing only |

Always check scope before adding a new dependency. Wrong scope (especially `provided` vs `compile`) is a common source of runtime errors. Because the runtime is **WildFly** (a full EE server), the Jakarta EE APIs are `provided` — do **not** bundle a JAX-RS/CDI implementation in the WAR.

---

## What to Avoid

- Do not introduce Spring, Spring Boot, or any other web framework — the stack is Jakarta EE (JAX-RS + CDI)
- Do not add Hibernate or JPA — use plain JDBC (`QueryHelper`) for now
- Do not modify `compose.yaml` or `Dockerfile` without understanding the multi-stage build + WildFly deploy
- Do not put business logic inside JAX-RS resources — route to a `@ApplicationScoped` service
- Do not hand-build JSON with `org.json` in new endpoints — return DTOs and let JSON-B serialize
- Do not hardcode database credentials — use environment variables

---

## Current State

The project has migrated to a REST API. At the time of writing:

- `RestApplication` mounts JAX-RS at `/api`.
- Implemented endpoints: `POST /api/auth/{login,logout}`, `GET /api/courses`, `GET /api/courses/{id}`, `GET /api/courses/paths`, `GET /api/quizzes/{id}`, `GET /api/me`, `GET /api/students/me/enrollments`.
- The frontend has a backlog of further endpoints (dashboard aggregates, quests, achievements, modules, enroll/submit POSTs, subscription, admin metrics) — not yet implemented.

When helping scaffold new endpoints, build the full vertical slice: **DTO → DAO → service → JAX-RS resource**, with `@Secured` for authenticated routes and validation on request DTOs.
