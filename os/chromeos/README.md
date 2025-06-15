# Chromebook
主に開発や勉強、事務作業で利用

## Dockerを導入
公式のdocs参照  
https://docs.docker.com/engine/install/debian/

## VSCodeを導入
`uname -m`でアーキテクチャ確認  
公式のインストーラー使用 (arm64)  
https://code.visualstudio.com/download  
インストール後は`apt upgrade`で更新可能

## keyringを設定
VSCodeにおいてGitHub Copilotのログイン情報を保持するための設定を行う

### 手順
1. `gnome-keyring`をインストールする
    - コマンド: `sudo apt install gnome-keyring seahorse`
2. `gnome-keyring`を利用してVSCodeを起動する
    - コマンド: `code . --password-store="gnome-libsecret"`
3. コマンドパレットで`Preferences: Configure Runtime Arguments`を選択する
4. `argv.json`に以下を追加する
    ```json
    "password-store": "gnome-libsecret"
    ```

#### 参考
https://code.visualstudio.com/docs/configure/settings-sync#_recommended-configure-the-keyring-to-use-with-vs-code

### 説明
* **`gnome-keyring`**: パスワードマネージャーとして機能する
* **`seahorse`**: `gnome-keyring`に保存されたデータをGUIで操作するためのツールである
* **`argv.json`**: VSCodeを起動する際のデフォルト引数を設定するファイルである
  - 配置場所: `/home/(user)/.vscode`
  - 削除することで初期設定に戻すことが可能である

## BIZ UDゴシックを導入
1. Google FontsからBIZ UDゴシックをダウンロードする
1. 解凍したディレクトリをLinuxと共有する
1. `/usr/share/fonts`にttfをコピーする
1. `fc-chache -v`でフォントを更新する
1. `fc-list | grep -i biz`で確認する

### 補足
`半角:全角 = 1:2`であればほかのフォントでもいい

## キーボードショートカット（変更差分）
絵文字選択ツールを開く: `検索キー + .`