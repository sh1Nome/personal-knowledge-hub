### ぶっちゃけ`docker-compose.yml`とは
`docker`コマンド専用のシェルスクリプト、いろいろ勝手にやってくれるから便利だし、可読性〇

### 拡張子
`.yml`か`yaml`<br>

### コメント
`# これはコメント`<br>

### バージョン指定
`version: (n)`<br>
Compose定義ファイルのバージョンとDocker Engineのバージョンの関係から決定。<br>
未指定の場合、Compose定義ファイルのバージョンは`1.0`として動作する。<br>

## サービス定義
```
services: 
    webserver: 
    db: 
```

### イメージの指定
Dockerコンテナのベースイメージを設定できる。<br>
```
services: 
    webserver: 
        image: (イメージ名):(タグ)
```

### Dockerfileの指定
Dockerfileを自動的にビルドし、そのイメージをベースイメージにDockerコンテナを起動できる。<br>
<br>
例）カレントディレクトリにDockerfileがある場合<br>
```
services: 
    webserver:
        build: .
```

例）1階層下`dir`に`Dockerfile01`というDockerfileがある場合<br>
```
services: 
    webserver:
        build: 
            context: ./dir
            dockerfile: Dockerfile01
```

### コンテナ内で動かうコマンドの上書き
```
command: /bin/bash
```

※ENTORYPOINTの上書きも可能であり、列挙可能<br>
```
entorypoint:
    - httpd
    - -d
    - foregraund
```

### コンテナ間の連携
別コンテナへリンク機能を持たせられる。エイリアスは省略可能。<br>
```
links: 
    - (サービス名):(エイリアス)
    - (サービス名):(エイリアス)
```

### コンテナ間でのポート公開
リンク機能を使って連携するコンテナにのみポートを公開可能。<br>
ログサーバなど、ホストマシンから直接アクセスする必要のないコンテナに対して使う。<br>
```
expose: 
    - "(ポート番号)"
```

### ホストマシンからのポート転送
例）ホストマシンの8000番ポートをコンテナの80番ポートへ転送
```
`ports: 
    - "8000:80"
```

### 複数コンテナの起動順序制御
例）dbコンテナの後にwebserverを起動したい場合<br>
※停止順序はwebserver → dbとなる。<br>
※コンテナの起動順序のみを制御し、コンテナ内サービスの開始は見ない。<br>
```
services:
    webserver: 
        depend_on:
            - db
    db:
```

### `docker-compose.yml`内で使える変数の設定
`docker-compose.yml`と同階層に`.env`ファイルを置く。<br>
`docker compose up`コマンドを実行する際に一時的にシェル変数に設定。<br>
スコープは`docker-compose.yml`内。<br>

### イメージビルド時の変数の設定
`docker image build`コマンドを実行する際に使える変数を設定。<br>
スコープはイメージビルド。<br>
Dockerfile利用時は`ARG`で宣言が必要。<br>
```
services:
    service:
        build:
            args:
                (key): "(value)"
```

### コンテナ内環境変数の指定
`docker container run`コマンドを実行する際にコンテナの環境変数を設定。<br>
スコープはコンテナ起動。<br>
コンテナの環境変数を指定するときのみ利用すること。<br>
#### 配列形式
```
enviroment: 
    - HOGE=fuga
    - FOO
```

#### ハッシュ形式
```
enviroment: 
    HOGE: fuga
    FOO: 
```

#### env_fileの指定
環境変数を一つのファイルにまとめ、そのファイルを指定。<br>
```
env_file: (ファイルパス)
```

複数指定も可能。<br>
```
env_file: 
    - (ファイルパス)
    - (ファイルパス)
```

### コンテナ名の設定
```
container_name: (コンテナ名)
```

### ラベルの設定
#### 配列形式
```
labels: 
    - "(key1)=(value1)"
    - "(key2)=(value2)"
```

#### ハッシュ形式
```
labels: 
    key1: "value1"
    key2: "value2"
```

### ボリュームのマウント
```
volumes: 
    - (ホストのディレクトリパス):(コンテナのディレクトリパス)
```

`(コンテナのディレクトリパス):ro`とすることで読み取り専用にできる。<br>

### 標準入出力端末の設定
`tty: true`<br>
<br>
これを設定することで標準入出力端末を設定できる。<br>
プロセスとして標準入出力端末の設定が可能であるため、フォアグラウンドで起動できないサービスをコンテナで起動させ続けるために利用できる。<br>

### ネットワークの指定（IPアドレスの固定）
例）サービス名myserviceでmynetworkという名前のネットワークを指定<br>
```
services:
    myservice:
    networks:
        mynetwork:
```

例）上記例に加えてIPアドレスの固定化<br>
[ネットワーク定義](#ネットワーク定義)で定義されたネットワークを利用している想定。<br>
```
services:
    myservice:
    networks:
        mynetwork:
            ipv4_address: 192.168.10.100
```

### コンテナの自動起動設定
```
restart: always
```

## ネットワーク定義
```
networks:
    (ネットワーク名):
```

例）CIDR形式でネットワークを定義<br>
ネットワーク名は`mynetwork`、ネットワークは`192.168.10.0/24`
```
networks:
    mynetwork:
        driver: bridge
        ipam:
            driver: default
            config:
                - subnet: 192.168.10.0/24
```

## ボリューム定義
例）docker-compose用にボリュームを新規作成<br>

```
volumes:
    (ボリューム名):
```

例）すでに作成されたボリュームを利用<br>

```
volumes:
    (ボリューム名):
        external: true
```