# docker
DockerとDocker Composeについて

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