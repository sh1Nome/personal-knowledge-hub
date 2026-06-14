# Debian

メイン端末をFedoraに移行したので最近は使っていない。

## インストール・セットアップメモ

- グラフィックインストーラーの主な設定
  - パーティショニング: LVM 有効化、全ファイルを 1 パーティションに
  - ファイルシステム: ext4
  - パッケージ: Debian デスクトップ環境と Xfce のみ
  - ブートローダー: `/dev/sda`に GRUB をインストール
- 追加・変更したアプリ・設定
  - インストール
    - fcitx5
    - fcitx5-mozc
    - wezterm
    - git
    - chrome
    - vscode
    - vim-gtk3
    - docker
    - mise
    - ffmpeg
    - bash-completion
    - xclip
    - xcape
    - blueman
    - rfkill
    - systemd-timesyncd
    - build-essential
  - 時計: `timedatectl set-ntp true`で NTP 有効化
