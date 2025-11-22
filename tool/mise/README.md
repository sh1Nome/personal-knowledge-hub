# mise
miseは複数のプログラミング言語やツールのバージョンを管理できるツールマネージャー

## インストール
* `mise install` - `.mise.toml`や`.tool-versions`で定義されたツールをインストールする

## ツール管理
* `mise use` - プロジェクトの設定ファイルに追記
    * `-g` - グローバルの設定ファイルに追記
* `mise uninstall` - ダウンロードしたツールを消す
* `mise unuse` - 設定ファイルから消す
* `mise ls` - インストール済みツールの一覧表示
* `mise ls-remote` - インストール可能なバージョンの一覧表示
* `mise tool (tool-name)` - ツールの詳細を表示
* `mise search` - 利用可能なツールを検索
* `mise registry` - miseで利用可能なツールのレジストリを表示

## タスク管理
* `mise tasks` - 定義されているタスクの一覧を表示
* `mise run (task-name)` - 定義されたタスクを実行

## その他のコマンド
* `mise which (tool-name)` - 指定したコマンドの実際のパスを表示
* `mise exec -- (tool-name)` - mise環境でコマンドを実行
    * 短縮形: `mise x --`
* `mise upgrade` - インストール済みツールを最新バージョンにアップグレードする
    * 短縮形: `mise up`
