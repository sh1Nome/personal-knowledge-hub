#!/bin/sh
# Ansible インストールスクリプト (Debian/Ubuntu 系)
set -e

# 必要なパッケージのインストール
sudo apt update

# Ansible のインストール
sudo apt install -y ansible

# バージョン確認
ansible --version

# ユーザー入力を受け取る
echo "Git user.name を入力してください: "
read GIT_USER_NAME
echo "Git user.email を入力してください: "
read GIT_USER_EMAIL

# Ansible Playbook の実行
ansible-playbook -i localhost, ./init-dev-env.yml --extra-vars "git_user_name=$GIT_USER_NAME git_user_email=$GIT_USER_EMAIL"
