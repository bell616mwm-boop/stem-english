# GEMINI.md — STEM English web app

You are taking over development of this project from another AI assistant.
**Read `HANDOVER.md` in this repo first — it is the full spec.** Summary:

- Single-file web app: everything is embedded in `index.html`, published via
  GitHub Pages at https://bell616mwm-boop.github.io/stem-english/
  (repo `bell616mwm-boop/stem-english`, branch `main`).
- Master data lives in `data/terms-all.json` (6,534 terms, 15 decks);
  `data/` also holds the batch/merge/patch scripts used to build it.
- Binding content rules:
  1. Lessons are authored natively in all 5 languages (ja/en/ko/zh/tw) —
     never literal translations, never a Japanese fallback.
  2. Every lesson starts with its must-memorize formulas/laws panel (`must`).
  3. Clarity first: plain, easy explanations; analogies only where they
     genuinely fit, never forced (owner's rule, 2026-11-27). English at
     IELTS Band 6.0 level.
  4. Image generation is paused — do not create new word illustrations.
  5. Mobile-first UI (the owner uses iPhone/iPad).
- After uploading changes, always check the GitHub Pages build status;
  rapid single-file commits can silently leave the site stale.
- The owner (Toma) speaks Japanese. Report to him in short Japanese.
  Do not publish any of his private study materials.
