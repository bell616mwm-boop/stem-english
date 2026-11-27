# HANDOVER — STEM English Web App

Development of this project is being handed over. This document is the single
source of truth for what the app is, how it is built, and the content rules
that must not be broken. Read it fully before changing anything.

## What this is

- **Product**: "STEM English" — a web app that teaches STEM subjects
  (physics, chemistry, calculus, digital logic, semiconductor/IT vocabulary)
  *through English*, for non-native speakers who are starting university-level
  study in English.
- **Owner**: Toma Suzuki, first-year semiconductor-program student at NTUT
  (Taipei). The content is dogfooded from his own study notes — the topics he
  struggles with are exactly what the target users struggle with.
- **Live site**: https://bell616mwm-boop.github.io/stem-english/
- **Repo**: `bell616mwm-boop/stem-english` (public, GitHub Pages from `main`, root)
- **Target English level**: IELTS Band 6.0. Natural collocations and accuracy
  over rare advanced vocabulary.

## Architecture

- **Single-file app**: everything (CSS, JS, all lesson content, all 6,534 term
  records) is embedded in `index.html` (~2.6 MB). There is no build step and
  no runtime fetch of data files. To change the app, edit `index.html`.
- `assets/vis/*.webp` — per-word illustration images referenced from the term
  data (`vis` field). ~599 images.
- `data/` — the *build pipeline and master data*, not used at runtime:
  - `terms-all.json` — master term list (6,534 records; see schema below).
  - `i18n-lessons-<subject>-<lang>.json` — lesson text per subject/language.
  - `batch-v*.py` / `merge-v*.py` / `patch-v*.py` — scripts that generated and
    merged term batches and patched `index.html` version by version
    (v71…v97). `index-backup-v*.html` files are snapshots before each patch.
  - When adding terms: add them to `terms-all.json` via a batch + merge
    script (follow the existing pattern), then embed into `index.html`.
- PWA: `manifest.webmanifest` + icons at repo root.

## Term record schema (`terms-all.json`)

```json
{
  "ch": 1,                 // chapter / unit number within the deck
  "deck": "physics",       // deck id (see below)
  "en": "dimension",       // English term
  "ja": "次元", "ko": "차원", "zh": "量纲", "tw": "量綱",
  "nja": "…", "nko": "…", "nzh": "…", "ntw": "…",  // short note per language
  "def": "The kind of physical quantity: length [L], time [T], or mass [M].",
  "ipa": "/dɪˈmɛnʃən/",
  "vis": ["tags", "[L] · [T]"]   // visual hints / image keys
}
```

Decks (15): physics 399, math 318, chem 424, bio 263, earth 213,
materials 160, general 109, ielts 1032, it 782, toeic 1500, programming 600,
progfunc 400, digilogic 116, elements 118, substances 100. Total 6,534.

## App features (current)

- Lessons-first design. 14 lessons × 5 UI languages (ja/en/ko/zh/tw):
  trigonometry, square roots, logarithms, limits, differentiation
  (intro / rules / functions / applications), integration (intro / apps),
  chemistry (Ebbing Ch. 1–3), digital logic.
- Flashcards with word states: まだ / 覚えた / 覚えてない (not started /
  learned / not yet), stored in localStorage.
- Home: 「今日の単語10」 (today's 10 words), streak counter, daily-goal ring.

## Content rules — BINDING, do not break

1. **Lessons are AUTHORED per language, never translated.** Every lesson must
   exist natively in all 5 languages (ja/en/ko/zh/tw). Where the Japanese
   original uses a culture-specific analogy, rephrase with an analogy natural
   for that language community. **No Japanese fallback**: no UI string may
   silently fall back to Japanese in another language's UI.
2. **Every lesson opens with the must-memorize panel** (the lesson's `must`
   field: 「まず覚える公式・法則」 — the unit's essential formulas/laws),
   rendered BEFORE the lesson sections.
3. **Clarity first** (owner's rule, 2026-11-27): plain, direct explanations
   that are simply easy to follow come before everything else. Use an
   analogy or everyday example ONLY where it genuinely fits the concept —
   never force one in. Written so a middle-schooler with gaps in high-school
   basics can follow.
   The owner missed Math III / applied tracks and has a ~4-year study gap;
   the target users are like him.
4. **English at IELTS Band 6.0** — natural collocations, no rare vocabulary
   showing off.
5. **Fractions** in study content are written as proper stacked fractions,
   not slashes.
6. **Image generation is PAUSED.** Do not generate new word illustrations
   unless the owner explicitly resumes it.
7. **Mobile-first.** The owner uses an iPhone / iPad, essentially never a PC.
   Any UI change must work well on a phone screen first.

## Local preview (Windows, owner's Zenbook)

- Double-click **`preview.bat`** in the repo root (or run
  `node preview-server.mjs`). It serves the repo at
  **http://localhost:8000** and opens the browser automatically.
- `preview-server.mjs` is a zero-dependency Node static server with caching
  disabled, so edits to `index.html` appear on a plain browser reload.
- Keep the server window open while previewing; closing it stops the server.
- When developing with an agent (e.g. Antigravity CLI), start this server
  first so the owner can watch changes live in the browser.

## How to ship a change

1. Edit `index.html` (use a patch script under `data/` for large or repeated
   edits, following the `patch-v*.py` pattern; keep an `index-backup-v*.html`
   snapshot before patching).
2. Upload to GitHub with the Contents API (PUT
   `/repos/bell616mwm-boop/stem-english/contents/index.html`, branch `main`,
   with the current file `sha`).
3. **Verify the Pages build afterwards** (GET `/repos/.../pages`): rapid
   sequences of single-file commits have previously left the build `errored`
   and the site stale even though uploads returned 200. If errored, trigger a
   rebuild (POST `/repos/.../pages/builds`). Prefer few, batched commits.
4. Reload the live site and confirm the change is actually served.

## Out of scope (separate codebases — do not confuse with this repo)

- Figma design based on the "Talkie" template (design only, not this code).
- Native iOS version (Swift Playgrounds package) — separate project.
- Multi-subject study app (10 subjects) — separate web app, separate data.

## Suggested next work (owner's direction, not yet commissioned)

- More lessons built from the owner's ongoing NTUT coursework (calculus,
  chemistry, physics) in the same authored-5-language format.
- The premium direction (semiconductor / AI / IT vocabulary for motivated
  non-native professionals) is **unproven as a market** — do not build paid
  features or pricing until the owner says so.

## Working agreements

- The owner communicates in Japanese; status reports to him should be in
  Japanese, short, and free of questions unless a real decision is blocked.
- Do not publish the owner's private study materials (notes, photos, school
  documents) anywhere public. This app's own content is the only public asset.
