# STEM English Cards（仮）

英語で学問（物理・化学・微積分・半導体）を学ぶための用語カード Web アプリ。
単一HTMLファイルで動作する MVP。後から Capacitor で包めば iOS / Android アプリとしてもリリースできる設計。

## 現在の内容
- `index.html` — 物理 Ch.1–4 の英語用語 58 語（英語 → 日本語＋一言説明）
  - 出典：Toma の物理中間テスト対策ノート（Notion）の Key terms
  - 機能：章フィルター、シャッフル、「覚えた」記録（localStorage）、「まだのカードだけ」復習モード

## ロードマップ（案）
1. 化学・微積分の用語集を同じ器に追加
2. 半導体／AI／IT ニュース連動の単語パック（プレミアム版の核）
3. ログイン＋サーバー保存（Supabase 等）
4. Web 課金（Stripe）→ Capacitor でアプリ版

## 開発メモ
- Zenbook 側で開くときは `index.html` をブラウザで開くだけで動作確認できる
- GitHub リポジトリ化はアカウント準備ができ次第（Pages 公開も可）
