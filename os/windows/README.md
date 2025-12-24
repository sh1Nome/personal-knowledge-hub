# Windows
ゲーム・開発・動画編集など様々な用途で利用

## 設定

### キー設定
| キー        | 変更後         |
| :---------- | :------------- |
| 無変換      | IMEオフ        |
| 変換        | IMEオン        |
| PrintScreen | 画面キャプチャ |

### マウス
加速オフ

## 導入アプリ
### IT
* git
* tortoisegit
* mise
* glab
* winscp
* winmerge
* rlogin
* vscode
* docker
* wsl
    * debian
* postman
* windows terminal
    * `<C-v>`で貼り付けを削除
* virtualbox
* fakeSMTP
* rufus

### Game
* steam
* vortex
* battle.net
* epic
* xbox

### Create
* obs
* davinci resolve

### Util
* powertoys
* microsoft pc manager
* everything
* サクラエディタ
* google日本語入力
* tablacus explorer
    * 追加したアドオン
        * Everything
        * 拡張機能お気に入りバー（水平）
        * 更新
        * 自動更新
        * アドオンの更新
    * 無効化したアドオン
        * ツールバー
    * 例外：マルチプロセスを有効化しマルチスレッドを無効化
        * https://x.com/tablacus/status/1922641447267770654
* edge
* chrome
* 7-zip
* geforce experience
* discord
* twinkle tray
* screen to gif
* thunderbird

### Archive
いいアプリだったけど使わなくなった奴
* ear trumpet
* banana
* upnote
* vlc media player
* beutl

## cmd
### ヘルプ
* `(command) /h`
    * コマンドのヘルプを表示する
* `where (command)`
    * コマンドのパスを表示する

## PowerShell
### ヘルプ
* `help (command)`
    * コマンドのヘルプを表示する
* `Get-Command (command)`
    * コマンドのパスを表示する
    * （`where.exe (command)`）でもOK

## winget
パッケージ管理ツール。
* `winget upgrade --id パッケージ名` - パッケージをアップデート
* `winget install --id パッケージ名` - パッケージをインストール
* `winget uninstall --id パッケージ名` - パッケージをアンインストール
* `winget list` - インストール済みパッケージを表示
* `winget list --upgrade-available` - アップデートできるパッケージ一覧を表示

## ssh

秘密鍵の権限エラーが起きたときにやること

1. エクスプローラーから秘密鍵のプロパティを開く
1. セキュリティタブから詳細設定を開く
1. 「継承の無効化」を開き、すべて削除する
1. 自分のユーザーアカウントだけを追加し、フルコントロールをつける
