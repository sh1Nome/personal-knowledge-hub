# Dockerコマンドチートシート
## ヘルプの表示
`docker [コマンド] --help`<br>
困ったらこれ。オプション知りたいときとか。<br>

## 知っておくといいこと
### 省略記法
`docker (なにか)`から始まるコマンドは`docker`のみで動作する場合がある。しかし、何を操作しているのか明確にするために省略しない方がいいらしい。<br>

### イメージとタグの命名
イメージとタグの命名には注意点がある。Docker Hubに作成したイメージを登録するにはイメージ名を`(Docker Hubのユーザ名)/(イメージ名)`とする必要がある。また、タグはわかりやすいようにバージョンを付けるのが一般的。<br>
また、プライベートリポジトリにイメージを登録するときはイメージ名を`(アップロードするレジストリのアドレス):(ポート番号)/(イメージ名)`とする必要がある。<br>

### docker-compose.ymlが楽
docker-compose.ymlが楽

## イメージ関連

### Docker Hubからイメージのダウンロード
`docker image pull [オプション] (イメージ名):(タグ)`<br>

### ダウンロードしたイメージリスト
`docker image ls [オプション] (イメージ名):(タグ)`<br>
#### オプション
- `-a`：すべてのイメージ
- `--digests`：ダイジェスト値を表示
- `--no-trunc`：省略表示なし

### イメージの詳細
`docker image inspect [オプション] (イメージ名):(タグ)`<br><br>

### イメージのタグ設定
`docekr image tag (元イメージ名):(元タグ) (設定イメージ名):(設定タグ)`<br><br>
[イメージとタグの命名](#イメージとタグの命名)参照<br>
一時的にエイリアスの作成を行っている。<br>
片方のイメージに変更が加えられるとイメージIDが変わる。<br>

### イメージの削除
`docker image rm [オプション] (イメージ名):(タグ名)`<br>
#### オプション
- `-f`：強制的に削除
- `--no-prune`：中間イメージを削除しない

### 使用していないイメージを削除
`docker image prune [オプション]`
#### オプション
- `-a`：すべて
- `-f`：強制的に

### コンテナからイメージ作成
`docker container commit [オプション] (コンテナ名) (イメージ名):(タグ)`<br><br>
[イメージとタグの命名](#イメージとタグの命名)参照<br>

### tarファイルからイメージインポート
tarファイルからイメージのインポートには2種類ある。<br>事前に行ったtarファイルのエクスポート方法によって使用するコマンドが違うため注意。<br>
補足：`docker container export`の場合、コンテナのファイル群がそのまま圧縮される。<br>
#### `docker container export`で出力したtarファイルの場合
`docker image import (tarファイルパス) (イメージ名):(タグ)`<br><br>

#### `docker image save`で出力したtarファイルの場合
`docker image load -i (tarファイルパス)`<br>

### イメージからtarファイルへエクスポート
`docker image save -o (出力ファイルパス) (イメージ名)`<br>

### イメージ作成時のコマンド履歴確認
`docker image history (イメージ名):(タグ)`<br>

### Dockerfileからイメージの作成
`docker image build [オプション] (Dockerfileが置いてあるフォルダパス)`<br>
#### オプション
- `-t (イメージ名):(タグ)`：生成するイメージのイメージ名とタグを指定
- `-f (ファイル名)`：Dockerfile名を指定、デフォルト：Dockerfile
- `--no-cache`：中間イメージを再利用しない

## コンテナ関連

### コンテナの作成/起動
`docker container run [オプション] (イメージ名):(タブ名) [コマンド]`<br>
#### オプション
- 基本設定
    - `--name (コンテナ名)`：コンテナ名を設定
    - `-d`：デタッチモード、バックグラウンドで起動させる
    - `-i`：コンテナの標準入力を開く
    - `-t`：端末デバイスを使う
        - `-it`：コンソールに結果を出力してくれる
    - `--rm`：コマンド実行完了後にコンテナを自動で削除
- ネットワーク設定
    - `-p (ホストのポート):(コンテナのポート)`：ホストとコンテナのポートマッピング、ポートバインディング
- リソース設定
    - `-v=(ホストのディレクトリ):(コンテナのディレクトリ)`：ボリュームのマウント<br>
    ホストのディレクトリにはDockerボリュームも指定可能<br>

### コンテナのログ確認
`docker container logs (コンテナ名)`<br>

### コンテナの生成
`docker container create`<br>

### コンテナの起動
`docker container start (コンテナ名)`<br>
コンテナは複数指定可能<br>

### コンテナの停止
`docker container stop [オプション] (コンテナ名)`<br>

### コンテナの再起動
`docker container restart [オプション] (コンテナ名)`<br>

### コンテナ一覧
`docker container ls [オプション]`<br>
#### オプション
- `-a`：すべて表示、これがないと起動中のコンテナのみ表示
- `--no-trunc`：省略表示なし

### コンテナの詳細
`docker container inspect [オプション] (コンテナ名)`<br>

### 特定のコンテナの稼働状況
`docker container stats (コンテナ名)`<br>

### コンテナの中断
`docker container pause (コンテナ名)`<br><br>
起動中のコンテナを一時中断できる<br>

### 中断したコンテナの再開
`docker container unpause (コンテナ名)`<br>

### コンテナの削除
`docker container rm (コンテナ名)`<br>
#### オプション
- `-f`：強制的に

### 使用していないコンテナを削除
`docker container prune`<br>

### 稼働コンテナへの接続
`docker container attach (コンテナ名)`<br>

### 稼働コンテナでプロセス実行
`docker container exec [オプション] (コンテナ名) [コマンド]`<br>
#### オプション
- `d`：デタッチモード、バックグラウンドで起動
- `i`：コンテナの標準入力を開く
- `t`：端末デバイスを使う

### 稼働コンテナのプロセス確認
`docker container top (コンテナ名)`<br>

### 稼働コンテナのポート転送確認
`docker container port (コンテナ名)`<br>

### コンテナ名変更
`docker container rename (元コンテナ名) (変更後コンテナ名)`<br>

### コンテナ内のファイルをコピー
`docker container cp (コピー元ファイルパス) (コピー先ファイルパス)`<br><br>
コンテナ内のファイルパスは以下のように示す。<br>
`(コンテナ名):(ファイルパス)`

### コンテナ操作の差分確認
`docker container diff (コンテナ名)`<br>

### コンテナをtarファイルにエクスポート
`docker container export [オプション] (コンテナ名)`<br>
#### リダイレクトで出力ファイルパスを指定
`docker container export [オプション] (コンテナ名) > (出力ファイルパス)`<br><br>
出力ファイルパスに`.tar`をつけ忘れないように。<br>

## ネットワーク関連

### ネットワークの一覧表示
` docker network ls`
#### オプション
- `--no-trunc`：省略表示なし

### ネットワークの作成
`docker network create [オプション] (ネットワーク名)`<br>

### ネットワークへの接続
`docker network connect [オプション] (ネットワーク名) (コンテナ名)`<br>

### ネットワークからの切断
`docker network disconnect (ネットワーク名) (コンテナ名)`<br>

### ネットワークの詳細情報
`docker network inspect [オプション] (ネットワーク名)`<br>

### ネットワークの削除
`docker network rm [オプション] (ネットワーク名)`<br>

## ボリューム関係

### ボリュームの作成
`docker volume create [オプション] (ボリューム名)`<br>

### ボリュームの詳細
`docker volume inspect [オプション] (ボリューム名)`<br>

### ボリュームの一覧
`docker volume ls [オプション]`<br>

### 使用していないボリュームの削除
`docker volume prune [オプション]`<br>
#### オプション
- `-a`：すべて
- `-f`：強制的に

### ボリュームの削除
`docker volume rm [オプション] (ボリューム名)`<br>
#### オプション
- `-f`：強制的に

## Docker Compose関連
### 複数コンテナのビルド・起動
`docker compose up [オプション]`<br>
#### オプション
- `-d`：デタッチモード

### 複数コンテナの一覧
`docker compose ps [オプション]`<br>
#### オプション
- `-a`：すべて表示

### 複数コンテナのログ
`docker compose logs`

### コンテナでのコマンド実行
`docker compose run (コンテナ名) [コマンド]`<br>

### 複数コンテナの起動
`docker compose start [オプション]`<br>

### 複数コンテナの停止
`docker compose stop [オプション]`<br>

### 複数コンテナの再起動
`docker compose restart [オプション]`<br>

### 複数コンテナの一時停止
`docker compose pause`<br>

### 複数コンテナの再開
`docker compose unpause`<br>

### サービスのポート確認
`docker compose port [オプション] (サービス名) (ポート番号)`<br>

### docker-compose.ymlの内容確認
`docker compose config [オプション]`<br>

### 複数コンテナの強制停止
`docker compose kill [オプション]`<br>

### 複数コンテナの一括削除
`docker compose rm [オプション]`<br>

### Docker Composeで管理されるリソースの削除
`docker compose down [オプション]`<br>
<br>
実行中のコンテナを停止・削除し、イメージ・ネットワークを一括削除する。<br>
#### オプション
- `--rmi all`：すべてのイメージ削除

## Docker Hub関連

### 公開されているイメージの検索
`docker search [オプション] (検索ワード)`<br>
#### オプション
- `--no-trunc`：結果を省略表示しない
- `--limit`：結果表示数の上限
- `--filter=stars=(n)`：お気に入りがn以上のもののみ表示

### Docker Hubへログイン
`docker login [オプション] (サーバ)`<br><br>
オプションを指定しないと、ユーザ名とパスワードを聞かれる。<br>
サーバを指定しないと、Docker Hubに接続される。別環境にDockerリポジトリがある場合は指定する。<br>
Docker Hubで2FA設定している場合、CLIからのログインにはアクセストークンが必要。下記コマンドを入力するとアクセストークンの入力が求められる<br>
`docker login -u (ユーザ名)`<br>

#### オプション
- `-p`：パスワード指定
- `-u`：ユーザ名指定

### イメージのアップロード
`docker image push (イメージ名):(タグ名)`<br>

### Docker Hubからログアウト
`docker logout (サーバ)`<br>

## その他
### バージョン確認
`docker version`<br>

### 実行環境の確認
`docker system info`<br>

### ディスク利用状況
`docker system df`<br>
#### オプション
- `-v`：詳細

### 不要なイメージ、コンテナなどの一括削除
`docker system prune [オプション]`<br><br>
使用していないイメージ、コンテナ、ボリューム、ネットワークを一括削除。<br>
#### オプション
- `-a`：すべて
- `-f`：強制的に