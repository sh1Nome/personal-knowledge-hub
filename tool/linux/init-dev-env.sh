#!/bin/sh
# 開発環境初期化スクリプト (Debian/Ubuntu 系)
set -e

# スクリプトのあるディレクトリに移動
cd "$(dirname "$0")"

# sudoで実行されていない場合はsudoで再実行
if [ "$(id -u)" -ne 0 ]; then
    SCRIPT_PATH="$(pwd)/$(basename "$0")"
    echo "このスクリプトはsudoで実行する必要があります。sudoで再実行します..."
    exec sudo sh "$SCRIPT_PATH" "$@"
fi

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
ansible-playbook --become --become-user=$SUDO_USER -i localhost, ./init-dev-env.yml --extra-vars "git_user_name=$GIT_USER_NAME git_user_email=$GIT_USER_EMAIL"
