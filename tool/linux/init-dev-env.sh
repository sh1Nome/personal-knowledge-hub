#!/bin/sh
# Ansible インストールスクリプト (Debian/Ubuntu 系)
set -e

# 必要なパッケージのインストール
sudo apt update

# Ansible のインストール
sudo apt install -y ansible

# バージョン確認
ansible --version

# Ansible Playbook の実行
ansible-playbook ./init-dev-env.yml
