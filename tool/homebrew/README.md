# Homebrew

macOS（およびLinux）向けのパッケージマネージャー。コマンドラインツールやアプリケーションを簡単にインストール・管理できる。

## 基本コマンド

### インストール・削除
* `brew install (パッケージ名)`
    * パッケージをインストールする
* `brew uninstall (パッケージ名)`
    * パッケージをアンインストールする
* `brew reinstall (パッケージ名)`
    * パッケージを再インストールする

### 情報表示
* `brew list`
    * インストール済みパッケージ一覧を表示する
* `brew search (パッケージ名)`
    * パッケージを検索する
* `brew info (パッケージ名)`
    * パッケージの詳細情報を表示する
* `brew deps (パッケージ名)`
    * パッケージの依存関係を表示する

### 更新・メンテナンス
* `brew update`
    * Homebrew自体とフォーミュラ（パッケージ定義）を更新する
* `brew upgrade`
    * インストール済みパッケージを更新する
* `brew upgrade (パッケージ名)`
    * 特定のパッケージのみを更新する
* `brew outdated`
    * 更新可能なパッケージ一覧を表示する
* `brew cleanup`
    * 古いバージョンのパッケージを削除する
* `brew doctor`
    * システムの問題をチェックする

### Cask（GUIアプリケーション）
* `brew install --cask (アプリ名)`
    * GUIアプリケーションをインストールする
* `brew list --cask`
    * インストール済みCaskアプリ一覧を表示する
* `brew uninstall --cask (アプリ名)`
    * Caskアプリをアンインストールする

## サービス管理
* `brew services list`
    * サービス一覧を表示する
* `brew services start (サービス名)`
    * サービスを開始する
* `brew services stop (サービス名)`
    * サービスを停止する
* `brew services restart (サービス名)`
    * サービスを再起動する

## Tips
* Homebrewは `/opt/homebrew`（Apple Silicon Mac）または `/usr/local`（Intel Mac）にインストールされる
* `brew bundle` を使用してBrewfileからパッケージを一括管理可能
* `brew tap` で公式以外のリポジトリを追加可能