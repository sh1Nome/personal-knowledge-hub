# Linux

## パッケージ管理システム

Linux ディストリビューションにおいて、ソフトウェアのインストール、アップグレード、設定、削除を自動化するシステム。

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

#### asdf

複数のプログラミング言語・ツールのバージョン管理を行うツール。  
プロジェクトごとに異なるバージョンのnode.js、python、ruby等を切り替えられる。

#### mise

asdfの後継的な位置づけのバージョン管理ツール。  
2025年時点で使えるバックエンドが増えており、aquaが主流となっている。  
npmパッケージやgithubリリースからバイナリを落とすこともできる。

## IME（Input Method Editor）

### fcitx5
Linux環境で利用される入力メソッドフレームワーク。最近はこれが使われることが多い。

### uim
Linux環境で利用される入力メソッドフレームワーク。かつてよく使われていた。

### im-config
入力メソッドフレームワークの設定を管理するツール。
* `im-config -n fcitx5` - IMフレームワークをfcitx5に設定
* `im-config -m` - 現在の設定値を表示

## POSIX

Portable Operating System Interface の略。  
Unix 系 OS の標準仕様を定めた規格。異なる Unix 系 OS 間での移植性を向上させることを目的としている。  
システムコール、コマンドライン、シェルなどのインターフェースを標準化している。

## systemd

サービスユニットファイルの例。  
他にも`Requires`や`Wants`で依存関係を設定できる。  
Typeは以下の判断基準で選択する。  

* simple: 常駐プロセスの場合
* forking: 親プロセスが子プロセスを常駐させ、親プロセスが終了する場合
* oneshot: 1回実行できれば成功の場合

その他詳細は`man systemd.service`で確認。

```
[Unit]
Description=Foo
After=bar.service
Before=baz.service

[Service]
User=user
Type=simple
ExecStart=/usr/sbin/foo-daemon

[Install]
WantedBy=multi-user.target
```

配置場所は`/etc/systemd/system`。  
詳細は`man systemd.unit`を確認。

## UNIX

### UNIX哲学
* 1つのことをうまくやる小さなプログラムを作る
* プログラムを組み合わせて動くように作る
* すべてをテキストストリームで扱う（ユニバーサルインターフェース）

### BSD（Berkeley Software Distribution）
カリフォルニア大学バークレー校で開発されたUnixの派生OS。  
TCP/IPスタックなど多くの重要な機能を追加し、現代のUnix系OSに大きな影響を与えた。  
FreeBSD、OpenBSD、NetBSDなどの派生系統が現在も開発されている。

## システム管理ツール

### tasksel

Debian系ディストリビューションでタスク（関連パッケージのセット）を簡単にインストールするためのツール。
