# Debian

メイン端末をFedoraに移行したので最近は使っていない。

## インストール・セットアップメモ

- ISO イメージのダウンロードと検証
  - jaist 等のミラーから ISO を取得
  - `sha256sum`でハッシュ値を計算し、公式 SHA256SUMS と一致するか確認
    - sha256sum: ISOイメージファイルの整合性を検証する。ダウンロード中の破損や改ざんがないかを確認
  - SHA256SUMS と署名ファイル（.sign）を取得し、Debian 公式公開鍵で`gpg --verify`して検証
    - gpg: チェックサムファイル（SHA256SUMS）自体が正規のものであることを検証する。公式の署名により、チェックサムファイルの信頼性を確保
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
