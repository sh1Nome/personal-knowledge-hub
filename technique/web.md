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

## ネットワーキング

### DNS (Domain Name System)
ドメイン名をIPアドレスに変換するシステム。インターネットの電話帳として機能し、  
人間が覚えやすいドメイン名（example.com）をコンピューターが理解するIPアドレス（192.0.2.1）に変換する。

#### DNSレコードタイプ
* **Aレコード**: ドメイン名をIPv4アドレス（32ビット）に対応付ける。最も基本的なレコードタイプ。
  * 例: `example.com. IN A 192.0.2.1`
* **AAAAレコード**: ドメイン名をIPv6アドレス（128ビット）に対応付ける。
  * 例: `example.com. IN AAAA 2001:db8::1`
* **CNAMEレコード**: ドメイン名を別のドメイン名にエイリアス（別名）として対応付ける。正規名（Canonical Name）を指定する。
  * 例: `www.example.com. IN CNAME example.com.`
* **MXレコード**: メールサーバーを指定する。優先度を設定でき、数値が小さいほど優先される。
  * 例: `example.com. IN MX 10 mail.example.com.`
* **TXTレコード**: ドメインに関する任意のテキスト情報を記録する。SPF、DKIM、DMARC等の設定に使用される。
  * 例: `example.com. IN TXT "v=spf1 include:_spf.example.com ~all"`
* **NSレコード**: ドメインの権威DNSサーバーを指定する。
  * 例: `example.com. IN NS ns1.example.com.`
* **SOAレコード**: ゾーンの管理情報を記録する。プライマリネームサーバー、管理者メール、シリアル番号、更新間隔などを含む。
  * 例: `example.com. IN SOA ns1.example.com. admin.example.com. 2024010101 3600 900 604800 86400`
* **PTRレコード**: IPアドレスからドメイン名への逆引きに使用される。
  * 例: `1.2.0.192.in-addr.arpa. IN PTR example.com.`

#### ゾーンファイル
DNSサーバーが管理するドメインの情報を記述したテキストファイル。  
ゾーンファイルには、そのドメインに関連するすべてのDNSレコード（A、AAAA、CNAME、MX、NS、SOAなど）が記述される。

**ゾーンファイルの例:**
```
$TTL 86400
@   IN  SOA ns1.example.com. admin.example.com. (
            2024010101  ; Serial
            3600        ; Refresh
            900         ; Retry
            604800      ; Expire
            86400 )     ; Minimum TTL

    IN  NS  ns1.example.com.
    IN  NS  ns2.example.com.
    IN  A   192.0.2.1
    IN  MX  10 mail.example.com.

www IN  A   192.0.2.1
mail IN A   192.0.2.2
```

#### 権威DNSサーバ
特定のドメインに対して正式な（権威のある）DNS情報を提供するサーバー。  
ドメインの所有者が管理し、そのドメインに関する最終的な情報源となる。  
権威DNSサーバーは、自身が管理するドメインについてのクエリに対して、キャッシュではなく実際のゾーンファイルから情報を返す。

**権威DNSサーバーの種類:**
* **プライマリ（マスター）サーバー**: ゾーンファイルの原本を保持し、編集可能なサーバー
* **セカンダリ（スレーブ）サーバー**: プライマリサーバーからゾーンファイルをコピーして保持する冗長化用のサーバー

### IANA (Internet Assigned Numbers Authority)
インターネットのIPアドレス、ドメイン名、プロトコル番号などの一意な識別子を管理する組織。  
ICANNの一部門として、グローバルなインターネット資源の割り当てと調整を行っている。

### ホスト名とドメイン名
* ホスト名: ネットワーク上の特定のコンピューターを識別する名前
* ドメイン名: インターネット上の領域を表す名前（example.com）
* サブドメイン名: ドメインの下位区分（blog.example.com の「blog」部分）
* FQDN: 完全修飾ドメイン名（ホスト名.ドメイン名）
* IPアドレス: ネットワーク上でデバイスを一意に識別する数値
* オリジン: プロトコル、ホスト名、ポート番号の組み合わせ（https://example.com:443）

### プロキシ
#### フォワードプロキシ
クライアントとサーバーの間に位置し、クライアントの代理でリクエストを送信する。  
キャッシュ、アクセス制御、匿名化などの機能を提供。

#### リバースプロキシ
サーバーの前に位置し、クライアントからのリクエストを受け取って適切なサーバーに転送する。  
負荷分散、SSL終端、キャッシュなどの機能を提供。

### NAT/NAPT
* NAT (Network Address Translation): プライベートIPアドレスとグローバルIPアドレスを変換する技術
* NAPT (Network Address Port Translation): NATにポート番号の変換を加えた技術。  
  1つのグローバルIPアドレスで複数のプライベートIPアドレスからの通信を可能にする

## ブラウザ機能

### PWA (Progressive Web App)
従来のWebサイトとネイティブアプリの中間に位置する技術。  
Service WorkerやWeb App Manifestを利用して、オフライン動作、プッシュ通知、ホーム画面へのインストールなどの機能を実現する。  
ネイティブアプリのようなユーザー体験を提供しながら、Webの利点（URLでのアクセス、アップデート不要など）を保持できる。

### ブックマークレット
ブラウザのブックマークとして保存できるJavaScriptコード。  
ブックマークをクリックすることで、現在表示しているページに対してJavaScriptを実行できる。  
`javascript:(function(){ /* コード */ })();` の形式で記述する。
