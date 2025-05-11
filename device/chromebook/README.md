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
VSCodeからGitHubCopilotへのログイン情報を保持するために必要な設定  
1. `gnome-keyring`を導入する
    1. `sudo apt install gnome-keyring seahorse`
1. `gnome-keyring`を利用してVSCodeを起動する
    1. `code . --password-store="gnome-libsecret"`
1. コマンドパレットで`Preferences: Configure Runtime Arguments`を選択する
1. `argv.json`に`"password-store":"gnome-libsecret"`を追加する
    1. 配置場所は`/home/(user)/.vscode/argv.json`であり、削除することで初期設定に戻すことが可能

## BIZ UDゴシックを導入
1. Google FontsからBIZ UDゴシックをダウンロードする
1. 解凍したディレクトリをLinuxと共有する
1. `/usr/share/fonts`にttfをコピーする
1. `fc-chache -v`でフォントを更新する
1. `fc-list | grep -i biz`で確認する

## キーボードショートカット（変更差分）
絵文字選択ツールを開く: `検索キー + .`