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

# Ansible Playbook の実行
ansible-playbook -i localhost, ./init-dev-env.yml --extra-vars "git_user_name=$GIT_USER_NAME git_user_email=$GIT_USER_EMAIL"
