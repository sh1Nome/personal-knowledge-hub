# Linux

## Debian

### インストール・セットアップメモ

- ISO イメージのダウンロードと検証
  - jaist 等のミラーから ISO を取得
  - `sha512sum`でハッシュ値を計算し、公式 SHA512SUMS と一致するか確認
  - SHA512SUMS と署名ファイル（.sign）を取得し、Debian 公式公開鍵で`gpg --verify`して検証
- グラフィックインストーラーの主な設定
  - パーティショニング: LVM 有効化、全ファイルを 1 パーティションに
  - ファイルシステム: ext4
  - パッケージ: Debian デスクトップ環境と Xfce のみ
  - ブートローダー: `/dev/sda`に GRUB をインストール
- 追加・変更したアプリ・設定
  - インストール: git, chrome, vscode, vim-gtk3, docker, bash-completion, rfkill, systemd-timesyncd
  - キーボードショートカット（本当はdotfilesで管理したいけど、いい方法が思いつかなくて妥協）
    - xfce4-appfinder: `Super + Space`
    - xflock4: `Super + L`
    - ウィンドウを最大化: `Super + Up`
    - ウィンドウを隠す: `Super + Down`
    - ウィンドウを画面左にタイル表示: `Super + Left`
    - ウィンドウを画面右にタイル表示: `Super + Right`
    - IMEオン: 変換
    - IMEオフ: 無変換
  - Bluetooth: `rfkill unblock bluetooth`後、bluetoothctl でペアリング・信頼設定
    1. `rfkill unblock bluetooth`
    1. `bluetoochctl`
       1. `power on`
       1. `agent on`
       1. `default-agent`
       1. `scan on`
       1. `pair (mac)`
       1. `scan off`
       1. `trust (mac)`
       1. `info (mac)`
  - 時計: `timedatectl set-ntp true`で NTP 有効化
  - ビープ音: `echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf`で無効化

## パッケージ管理システム

Linux ディストリビューションにおいて、ソフトウェアのインストール、アップグレード、設定、削除を自動化するシステム。

### Debian 系

#### dpkg

Debian 系のディストリビューションで利用される低レベルなパッケージ管理システム。deb パッケージを直接操作する。

#### apt-get

Debian 系のディストリビューションで利用されるパッケージ管理システム。dpkg をラップして、依存関係の解決などを行う。

#### apt

apt-get の後継となるパッケージ管理システム。apt-get の機能に加えて、プログレスバー表示などの機能が追加されている。

### Red Hat 系

#### rpm

Red Hat 系のディストリビューションで利用される低レベルなパッケージ管理システム。rpm パッケージを直接操作する。

#### yum

Red Hat 系のディストリビューションで利用されるパッケージ管理システム。rpm をラップして、依存関係の解決などを行う。

#### dnf

yum の後継となるパッケージ管理システム。yum の機能に加えて、パフォーマンスの向上や依存関係の解決の改善がされている。

### Arch 系

#### pacman

Arch Linux で利用されるパッケージ管理システム。高速で軽量、依存関係の管理が優秀。  
バイナリパッケージとソースパッケージ（AUR）の両方をサポート。

### その他

#### snap

Canonical によって開発されたパッケージ管理システム。ディストリビューションに依存しない。

#### flatpak

ディストリビューションに依存しないパッケージ管理システム。サンドボックス環境でアプリケーションを実行する。

#### AppImage

アプリケーションを単一のファイルとして配布するためのフォーマット。インストール不要で実行可能。

#### nix

関数型パッケージ管理システム。パッケージの依存関係を純粋関数として表現し、  
ロールバック可能で再現性の高い環境構築が特徴。NixOS の基盤でもある。

#### Homebrew

macOS（およびLinux）向けのパッケージマネージャー。コマンドラインツールやアプリケーションを簡単にインストール・管理できる。

## POSIX

Portable Operating System Interface の略。  
Unix 系 OS の標準仕様を定めた規格。異なる Unix 系 OS 間での移植性を向上させることを目的としている。  
システムコール、コマンドライン、シェルなどのインターフェースを標準化している。

## システム管理ツール

### tasksel

Debian系ディストリビューションでタスク（関連パッケージのセット）を簡単にインストールするためのツール。
