# KrishiSetu — Database Setup

This folder contains the PostgreSQL schema used by the KrishiSetu backend.

- `schema.sql` — all tables (users, produce_listings, orders, payments, logistics_jobs, price_history, ratings_feedback)
- `seed.sql` — sample demo data (run after schema.sql)

You have **two ways** to set this up. If you don't want to install anything locally, use **Option A (Supabase, free, cloud)** — this is also the easiest way to connect a real database to the static `frontend/` later.

---

## Option A — Supabase (free, cloud, no installation) — Recommended

1. Go to **[supabase.com](https://supabase.com)** and sign up (free tier is enough).
2. Click **"New Project"** → give it a name (e.g. `krishisetu`) → set a database password (save it somewhere safe) → choose a region close to India → **Create new project**. Wait ~2 minutes for it to spin up.
3. In the left sidebar, click **SQL Editor** → **New query**.
4. Open `database/schema.sql` from this repo, copy all of it, paste into the SQL editor, and click **Run**.
5. Repeat step 3–4 with `database/seed.sql` to load sample demo data.
6. Go to **Project Settings → API**. You'll find:
   - **Project URL**
   - **anon public key**
7. Put these into your `.env` file (copy `.env.example` → `.env`):
   ```
   DATABASE_URL=<Project Settings → Database → Connection string (URI)>
   SUPABASE_URL=<Project URL>
   SUPABASE_ANON_KEY=<anon public key>
   ```
8. You can now browse/edit your data anytime under **Table Editor** in the Supabase dashboard — useful for demos/judging.

---

## Option B — Local PostgreSQL

1. Install PostgreSQL: [postgresql.org/download](https://www.postgresql.org/download/)
2. Create the database:
   ```bash
   createdb krishisetu
   ```
3. Load the schema and sample data:
   ```bash
   psql -d krishisetu -f database/schema.sql
   psql -d krishisetu -f database/seed.sql
   ```
4. Update `.env` (copy from `.env.example`):
   ```
   DATABASE_URL=postgresql://postgres:postgres@localhost:5432/krishisetu
   ```
5. Start the backend — it will connect using this `DATABASE_URL`:
   ```bash
   cd backend
   pip install -r requirements.txt
   python app.py
   ```

---

## Connecting the static frontend to the database (future step)

Right now `frontend/` stores data in the browser's `localStorage` (no server needed). To make it a real shared database across devices:

- Easiest: use the **Supabase JS client** directly in `frontend/app.js` (Supabase has a generous free tier and a REST/JS API — no need to run the Flask backend at all for a hackathon demo).
- Full-stack route: point `frontend/app.js` at the Flask API in `backend/` instead, which itself talks to PostgreSQL.

Either approach can replace `localStorage` without changing the rest of the UI.
