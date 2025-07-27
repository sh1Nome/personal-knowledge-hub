# Linux
Debianを使うことが多い。

## よく使うアプリ
* bash
* bash-completion
* git
* vim
* vscode
* docker

## お試しに使っているアプリ
* Gemini CLI (node)
  * Debian標準リポジトリのNode.jsは古く要件を満たさないため、NodeSourceリポジトリから最新版をインストール
  * 参考: [Node.js — パッケージマネージャーを利用したNode.jsのインストール](https://nodejs.org/ja/download/package-manager/all#debian-and-ubuntu-based-linux-distributions)

## 使いたいアプリ
* Claude Code (node)

## パッケージ管理システム
Linuxディストリビューションにおいて、ソフトウェアのインストール、アップグレード、設定、削除を自動化するシステム。

### Debian系
#### dpkg
Debian系のディストリビューションで利用される低レベルなパッケージ管理システム。debパッケージを直接操作する。

#### apt-get
Debian系のディストリビューションで利用されるパッケージ管理システム。dpkgをラップして、依存関係の解決などを行う。

#### apt
apt-getの後継となるパッケージ管理システム。apt-getの機能に加えて、プログレスバー表示などの機能が追加されている。

### Red Hat系
#### rpm
Red Hat系のディストリビューションで利用される低レベルなパッケージ管理システム。rpmパッケージを直接操作する。

#### yum
Red Hat系のディストリビューションで利用されるパッケージ管理システム。rpmをラップして、依存関係の解決などを行う。

#### dnf
yumの後継となるパッケージ管理システム。yumの機能に加えて、パフォーマンスの向上や依存関係の解決の改善がされている。

### その他
#### snap
Canonicalによって開発されたパッケージ管理システム。ディストリビューションに依存しない。

#### flatpak
ディストリビューションに依存しないパッケージ管理システム。サンドボックス環境でアプリケーションを実行する。

#### AppImage
アプリケーションを単一のファイルとして配布するためのフォーマット。インストール不要で実行可能。
