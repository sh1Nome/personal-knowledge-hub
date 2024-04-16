# WSL2インストール
```
wsl --install
```

# SSHサーバインストール
```
sudo apt update
sudo apt install ssh
sudo systemctl restart sshd
```

# ホストの準備
* TCP/22解放
* IP固定

# 自動起動
以下`ps1`ファイルをタスクスケジューラでスタートアップ時自動実行させる
```
Start-Process wsl

netsh.exe interface portproxy delete v4tov4 listenport=22

$IP = (wsl -d Ubuntu exec hostname -I).Trim()
netsh.exe interface portproxy add v4tov4 listenport=22 connectaddress=$IP
```