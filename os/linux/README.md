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

