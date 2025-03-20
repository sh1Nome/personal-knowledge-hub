# Chromebook
主に開発や勉強、事務作業で利用

## Dockerを導入
公式のdocs参照  
https://docs.docker.com/engine/install/debian/

## VSCodeを導入
`uname -m`でアーキテクチャ確認  
公式のインストーラー使用 (arm64)  
https://code.visualstudio.com/download

## BIZ UDゴシックを導入
1. Google FontsからBIZ UDゴシックをダウンロードする
1. 解凍したディレクトリをLinuxと共有する
1. `/usr/share/fonts`にttfをコピーする
1. `fc-chache -v`でフォントを更新する
1. `fc-list | grep -i biz`で確認する

## キーボードショートカット（変更差分）
絵文字選択ツールを開く: `検索キー + .`