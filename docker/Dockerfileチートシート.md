## 知っておくといいこと
### 命令は大文字
Dockerファイルの基本構文は`命令 引数`。命令は大文字小文字を区別しないが、大文字で書くのが一般的。<br>

### レイヤーを少なく
Dockerfileでは1命令ごとにイメージが作成され、履歴が残る。容量面やセキュリティ面からも容量はできるだけ小さくしたほうがいい。`RUN`命令などは1命令にまとめることが多い。<br>

## Dockerfile構文

### コメント
`# これはコメント`<br>

### ベースイメージの指定（必須）
- `FROM (イメージ名)`<br>
- `FROM (イメージ名):(タグ)`<br>
- `FROM (イメージ名)@(ダイジェスト)`<br>

### コマンドの実行
コマンドの実行タイミングによって命令が異なるため注意。<br>
#### イメージ作成時
`RUN (コマンド)`<br>
#### コンテナ起動時実行（上書き不可）
`ENTRYPOINT (コマンド)`<br>
#### コンテナ起動時実行（上書き可能）
`CMD (コマンド)`<br><br>
作成したコンテナ内でコマンドを実行するためのもの。デーモンの起動などを行う。<br>
また`CMD`で指定したコマンドは、`ENTORYPOINT`のデフォルト引数になる。<br>
例）`ENTORYPOINT`で指定したコマンドの引数に`CMD`を利用<br>
```
FROM nginx:latest

ENTORYPOINT ["echo"]
CMD ["hello"]
```
上記Dockerfileをビルド・起動したときの出力は以下のようになる。<br>
```
> docker image build -t sample .
> docker container run -it --rm sample
hello

> docker image build -t sample .
> docker container run -it --rm sample aiueo
aiueo
```

#### Exec形式
コマンドは直接実行される。JSON配列で入力。<br>
シェルの環境変数やエイリアスを使えず、影響を受けない。<br>
例）RUNでechoコマンドを実行<br>
`RUN ["echo", "HelloWorld!"]`<br>
例）RUNでshを使い、echoコマンドを実行<br>
`RUN ["/bin/sh", "-c", "echo 'HelloWorld!'"]`<br>
#### Shell形式
コマンドには`/bin/sh -c`で利用できるコマンドを入力。<br>
Exec形式の省略記法のようなもの。<br>
例）RUNでechoコマンドを実行<br>
`RUN echo HelloWorld!`<br>

### 次回ビルド時に実行する命令
`ONBUILD (命令)`<br><br>
命令には`ADD`や`COPY`など入れ、次ビルド時にデプロイさせる方法がある。<br>

### システムコールシグナルの設定
`STOPSIGNAL (シグナル)`<br>

### コンテナのヘルスチェック命令
`HEALSHCHECK [オプション] CMD (コマンド)`<br><br>
`docker container inspect`コマンドで確認が可能。<br><br>
例）5分ごとに`https://www.google.com/`を3秒以内に表示できるか確認<br>
`HEALTHCHECK --interval=5m --timeout=3s CMD curl -f https://www.google.com/ || exit 1`<br>

#### オプション
- `--interval=n`：ヘルスチェックの間隔
- `--timeout=n`：ヘルツチェックのタイムアウト

### 環境変数の設定
#### 単一設定の場合
`ENV (key) (value)`<br>
#### 複数設定の場合
`ENV (key)=(value)`<br><br>

例）複数指定の例<br>
```
ENV test01=test01\
    test02=test02\ test03\
    test04=test04
```

### 作業ディレクトリの指定
`WORKDIR (ディレクトリパス)`<br><br>
2回目以降の`WORKDIR`は前回の`WORKDIR`を起点とした相対パスを使用可能。<br>

### 作業ユーザの指定
`USER (ユーザ名)`<br><br>
指定するユーザは`USER`命令より前に`RUN`命令で作成する必要がある。<br>

### ラベルの指定
`LABEL (key)=(value)`<br><br>
`docker image inspect`コマンドで確認可能。<br>

### コンテナのListenポート設定
`EXPOSE (ポート番号)/(プロトコル)`<br>

### Dockerfile内の変数を設定
`ARG (key)=(value)`<br><br>
変数値はDockerfile内で`$(key)`で呼び出せる。<br>

#### 宣言のみ
`ARG (key)`<br><br>
`docker-compose.yml`で設定した値になる。<br>

### デフォルトシェルの設定
`SHELL ["(シェルのパス)", "(パラメータ)"]`<br>

例）デフォルトシェルをbashにしたい場合<br>
`SHELL ["/bin/bash", "-c"]`<br>

### ファイルやディレクトリの追加・コピー
#### 追加
`ADD (ホストのパス) (イメージのパス)`<br><br>
`ADD`命令ではホストのパスにリモートURLの指定が可能。<br>
リモートURLからのダウンロードに認証が必要な場合は`RUN`命令で`wget`や`curl`コマンドを使用。<br>
`gzip`形式の解凍をしながらコピーできる。<br>

#### コピー
`COPY (ホストのパス) (イメージのパス)`<br>

### ボリュームのマウント
`VOLUME ["/(マウントポイント)"]`<br><br>
Dockerボリュームがマウントされる。作成されたDockerボリューム名はハッシュ化される模様。<br>

### マルチステージビルド
```
FROM (開発用ベースイメージ) AS (別名)

(Dockerfile命令)

FROM (プロダクション用ベースイメージ)

(Dockerfile命令)
```
<br>
上記Dockerfileをビルドすると、2つのイメージができる。<br>
プロダクション用のイメージには開発用のイメージ履歴が残らない。<br>