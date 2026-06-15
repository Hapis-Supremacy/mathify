# Changes Summary: Midtrans Payment Integration (completed)

This document describes the **finished** Midtrans payment flow. The initial PR (#43)
wired a standalone Snap demo in production mode; this revision turns it into a secure,
domain-integrated premium-upgrade feature.

---

## Flow overview

```
Dashboard "Upgrade" → GET /checkout?plan=MONTHLY|ANNUAL
    → create PENDING payments row (order tied to uid + plan)
    → Midtrans Snap token → checkout page
    → user pays in Snap popup
    → browser redirected to GET /payment/confirm?orderId=…
    → server re-verifies with Midtrans (CoreApi.checkTransaction)
    → on settlement: SubscriptionDAO.save(uid, PremiumStudent) + payments row → PAID
    → redirect /dashboard?upgrade=success (premium reflected via Student.getPremium())
```

Premium is **never** granted from the browser callbacks — only after server-side
verification. This works on localhost/Docker (no public webhook URL required).

---

## 1. Configuration

- **`pom.xml`** — Midtrans Java SDK `com.midtrans:java-library:3.2.2`; `<proc>none</proc>`
  on the compiler plugin to skip the SDK's transitive Lombok annotation processor.
- **`compose.yaml` / `.env.example`** — `MIDTRANS_SERVER_KEY`, `MIDTRANS_CLIENT_KEY`,
  `MIDTRANS_MERCHANT_ID`, and `MIDTRANS_IS_PRODUCTION` (defaults to `false` = **Sandbox**).

## 2. New backend

- **`util/MidtransService`** — reads env once, exposes shared `Config`, Snap + Core
  clients, the client key, and the production flag. Sandbox by default.
- **`controller/CheckoutServlet` (`/checkout`)** — auth-gated; maps `?plan` → price via
  the `Plan` enum, persists a PENDING `Payment`, generates a Snap token with item +
  customer details, forwards to the checkout page.
- **`controller/PaymentConfirmServlet` (`/payment/confirm`)** — verifies the order with
  Midtrans, checks ownership (uid match), grants/extends the subscription via
  `SubscriptionDAO`, and flips the `payments` row to PAID/FAILED. Idempotent.
- **`dao/PaymentDAO`** + **`model/Payment`** / **`model/PaymentStatus`** — the
  `payments` table (one row per checkout attempt).
- **`model/Plan`** — now carries price (IDR) and duration; computes expiry.

## 3. Wiring

- **`AuthFilter`** — `/checkout` and `/payment/*` now require a student session.
- **`StudentDashboardServlet` + `student/dashboard.jsp`** — load the subscription,
  show a "Premium" badge when active or Monthly/Annual upgrade buttons otherwise, plus a
  flash banner for the `?upgrade=success|pending|failed` return.
- **`schema.sql`** — new `payments` table (FK → `users`, indexed by uid).

## 4. Security / correctness fixes vs the initial PR

- Sandbox by default instead of hardcoded production with live keys.
- Order tied to the authenticated user; ownership re-checked on confirm.
- Server-side verification before granting premium (no trusting client callbacks).
- Real domain integration (`SubscriptionDAO` / `PremiumStudent` / `Plan`) per `TASKS.md`.
- Snap script URL switches between sandbox and production automatically.
