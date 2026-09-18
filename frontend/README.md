# Krishi Setu — GitHub Pages Ready

This build is intentionally **100% static**.

## Run locally

Double-click `index.html`.

No Node.js, npm, terminal, local server, build step, or backend installation is required.

## Publish to GitHub Pages

1. Create a GitHub repository.
2. Upload the contents of this folder to the repository root.
3. Open **Settings → Pages**.
4. Select **Deploy from a branch**.
5. Select `main` and `/ (root)`.
6. Save.

GitHub Pages will serve `index.html` directly.

## Current data model

The application uses browser `localStorage` so it remains fully functional without a server. Accounts, listings, orders, saved listings and support tickets are isolated by account ID within the browser.

Because GitHub Pages is static, this is not yet a shared cloud database between different devices. A future Supabase integration can replace the storage layer without replacing the HTML/CSS/JS UI.

## Recent fixes

- Support common questions now open real answers instead of sending users to a workspace.
- FAQ answers work on both the public Support page and dashboard Support page.
- Dashboard hamburger now collapses/expands the sidebar on desktop and opens/closes it on mobile.
- Dynamically-created farmer listing and buyer order forms are explicitly bound after modal creation.
- Listing creation persists the new listing and immediately refreshes the farmer workspace/marketplace.
- Buyer orders persist, generate unique order/tracking IDs, and reduce available quantity for farmer-created listings.
- No pre-seeded orders or support tickets are shipped with the app.
