# Web技術

## Webアーキテクチャ
### SPA (Single Page Application)
1つのHTMLページで構成されるWebアプリケーション。ページ遷移時に部分的にコンテンツを更新する。

### MPA (Multi Page Application)
複数のHTMLページで構成される従来型のWebアプリケーション。ページ遷移時にサーバーから新しいページを取得する。

### SSR (Server Side Rendering)
サーバー側でHTMLを生成してクライアントに送信する手法。初期表示が高速でSEOに有利。

### SSG (Static Site Generation)
ビルド時に静的なHTMLファイルを生成する手法。CDNでの配信に適しており、高速で安全。

### SSE (Server Sent Events)
サーバーからクライアントへのリアルタイム通信を実現する技術。WebSocketよりもシンプルで、HTTP上で動作する。

## セマンティックHTML
### セマンティックなHTML
HTMLの要素をその意味に応じて適切に使用すること。`<header>`, `<nav>`, `<main>`, `<article>`, `<section>`, `<aside>`, `<footer>`などの要素を使い、文書構造を明確にする。SEOやアクセシビリティの向上に寄与する。

## Webセキュリティ
### XSS (Cross-Site Scripting)
Webサイトに悪意のあるスクリプトを埋め込む攻撃。ユーザーの入力値を適切にエスケープすることで防げる。

### CSRF (Cross-Site Request Forgery)
ユーザーが意図しない処理を実行させる攻撃。CSRFトークンやSameSite Cookieで防御する。

### CORS (Cross-Origin Resource Sharing)
異なるオリジン間でのリソース共有を制御するブラウザのセキュリティ機能。適切なヘッダー設定が必要。

### サニタイズ (Sanitization)
ユーザー入力を無害化する処理。HTMLエスケープやSQL文字列の適切な処理など、XSS攻撃やSQLインジェクションを防ぐために必要。

## プロトコル
### HTTP (HyperText Transfer Protocol)
Webの基盤となる通信プロトコル。ステートレスで、リクエスト/レスポンス型の通信を行う。

### HTTPS (HTTP Secure)
HTTPをTLS/SSLで暗号化したプロトコル。通信内容の盗聴や改ざんを防ぐ。

### SSH (Secure Shell)
暗号化された安全なリモートアクセスプロトコル。サーバーへの安全なアクセスや、ファイル転送に使用される。

### SFTP (SSH File Transfer Protocol)
SSH上で動作するファイル転送プロトコル。FTPと異なり、全ての通信が暗号化される。