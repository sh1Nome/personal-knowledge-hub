# mise
miseは複数のプログラミング言語やツールのバージョンを管理できるツールマネージャー

## インストール
* `mise install (tool-name)` - 設定ファイルで定義されたツールをインストールする
* `mise use (tool-name)` - プロジェクトの設定ファイルに追記
  * `-g` - グローバルの設定ファイルに追記
* `mise uninstall (tool-name)` - ダウンロードしたツールを消す
* `mise unuse (tool-name)` - 設定ファイルから消す
  * `-g` - グローバルの設定ファイルから消す

## ツール管理
* `mise ls` - インストール済みツールの一覧表示
* `mise ls-remote (tool-name)` - インストール可能なバージョンの一覧表示
* `mise tool (tool-name)` - ツールの詳細を表示
* `mise search (tool-name)` - 利用可能なツールを検索
* `mise registry (tool-name)` - miseで利用可能なツールのレジストリを表示

## タスク管理
* `mise tasks` - 定義されているタスクの一覧を表示
* `mise run (task-name)` - 定義されたタスクを実行

## その他のコマンド
* `mise which (tool-name)` - 指定したコマンドの実際のパスを表示
* `mise exec -- (tool-name)` - mise環境でコマンドを実行
  * 短縮形: `mise x --`
* `mise upgrade` - インストール済みツールを最新バージョンにアップグレードする
  * 短縮形: `mise up`
