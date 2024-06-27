# 注意点
WSL版のDockerを使うとき、Windowsファイルシステム上にあるファイルを直接マウントするとパフォーマンスが大きく下がる。これはファイルシステム差異の問題。

# 対処法
そもそもマウントするリソースをWSLに置いてしまえば問題ない。  
WSLにUbuntuを入れ、Docker DesktopをUbuntで動かすというやり方がある。  
(Ubuntuじゃなくても可、WSL初期のディストリビューションがUbunt)

1. WSLにUbuntuを導入する
1. Dockerで以下設定を行う
    * General - `User the WSL 2 based engine`をオン
    * Resouces - WSL integration - `Ubuntu`をオン

# 作業例
## VSCodeのDev Containersを利用したい (GitHub利用)
ホストOSのWSL拡張機能でWSLに接続する。接続したWSLからDev Containers拡張機能でコンテナに接続する。

1. ホストOSのVSCodeにRemote Development拡張機能を入れる
1. [対処法](#対処法)を実施しる
1. Ubuntuを開く
1. 必要に応じて`git config`をする
1. `git clone (url)`で、GitHubのリポジトリをクローンする
1. カレントディレクトリをクローンしたリポジトリにする
1. `code .`をする (ホストOSのWSL拡張機能が動き、カレントディレクトリをVSCodeで開ける)
1. Dev Containers用のファイルを用意する (`.devcontainer`)
1. コマンドパレットで`Reopen in Container`を選択する