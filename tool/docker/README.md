# docker
DockerとDocker Composeについて

## compose.yml
`debian:latest`イメージをベースにした開発環境用のコンテナを定義します。ホストの`./mount`ディレクトリがコンテナ内の`/tmp`にマウントされます。

## よく使うコマンド
* `docker ps`
    * 起動しているコンテナ一覧を出力する
* `docker ps -a`
    * すべてのコンテナ一覧を出力する
* `docker image ls`
    * イメージ一覧を出力する
* `docker compose up -d --build`
    * カレントディレクトリのdocker-compose.ymlに従い、コンテナを起動する（バックグラウンド実行、ビルド）
* `docker compose down --rmi local -v`
    * カレントディレクトリのdocker-compose.ymlに従い、コンテナを停止する（ローカルのイメージを削除、ボリュームを削除）
* `docker exec -it (コンテナid) bash`
    * コンテナでbashを実行する
* `docker system prune -af`
    * 使用していないすべてのリソースを強制削除する
* `docker system df -v`
    * Dockerのディスク使用状況を詳細表示する
* `docker history (イメージid)`
    * イメージのビルドログを出力する
* `docker logs (コンテナID)`
    * コンテナのログを出力する
* `docker cp (パスA):(パスB)`
    * Dockerの実行ホストとコンテナ内でファイルをやり取りする
    * コンテナのパスは`(コンテナID):(パス)`と表記する
* `docker login`
    * Docker Hubにログイン
* `docker logout`
    * Docker Hubからログアウト

## Volumeのバックアップ
TODO: 動作確認
```yml
# docker-compose.yml
services:
  db:
    image: 'postgres:16'
    user: 'postgres'
    volumes:
      - 'db-data:/var/lib/postgresql/data'
volumes:
  db-data:
```
`db-data`をバックアップするには次のコマンドを使う。
```sh
docker run --rm -v db-data:/data -v $(pwd):/backup ubuntu tar -zcvf /backup/db-data-backup.tgz /data/
```
初期化とリストアをするには次のコマンドを使う。
```sh
docker run --rm -v db-data:/data -v $(pwd):/backup ubuntu bash -c "rm -rf /data/* && tar -zxvf /backup/db-data-backup.tgz -C /data"
```

## ファイアウォール

Dockerはiptables(nftables)に独自ルールを追加する。  
`docker run -p 8080:80 hoge`を実行すると、ホストの8080番ポートが0.0.0.0に公開され、外部からアクセスできるようになる。  
`-p 127.0.0.1:8080:80`とすることでホストOSからしかアクセスできないようにできる。

参考: https://docs.docker.com/engine/network/port-publishing/

## DinD（Docker in Docker）
Dockerコンテナ内でDockerデーモンを実行する方式。  
コンテナ内で完全に独立したDocker環境を構築できる。  
特権モードでの実行が必要で、セキュリティリスクが高い。

## DooD（Docker outside of Docker）
ホストのDockerソケットをコンテナにマウントし、ホストのDockerデーモンを利用する方式。  
コンテナからホストのDockerを操作できるため、DinDより軽量でシンプル。
