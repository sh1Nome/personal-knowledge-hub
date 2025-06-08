#!/bin/sh
# 開発環境初期化スクリプト (Debian/Ubuntu 系)
set -e

# パッケージリストの更新
apt update

# Ansible のインストール
apt install -y ansible

# Git ユーザー情報の入力
echo "Git user.name を入力してください: "
read GIT_USER_NAME
echo "Git user.email を入力してください: "
read GIT_USER_EMAIL

# SUDOを実行したユーザーのホームディレクトリを取得
SUDO_USER_HOME=$(eval echo ~$SUDO_USER)

# Ansible Playbook の実行
ansible-playbook -i localhost, ./init-dev-env.yml --extra-vars "git_user_name=$GIT_USER_NAME git_user_email=$GIT_USER_EMAIL sudo_user=$SUDO_USER sudo_user_home=$SUDO_USER_HOME"
