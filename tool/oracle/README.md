SYSDBAユーザーでの接続確認

```
sqlplus / as sysdba
```

SQLPlusの起動

```
sqlplus sys/(パスワード) as sysdba
```

Oracle起動

```
startup;
alter database open;
```

PDBの起動

```
alter pluggable database (PDB名) open;
```

PDBシャットダウン

```
alter session set container = (PDB名);
shutdown immediate;
```

PDBに接続する

```
alter session set container = (PDB名);
```

インスタンス先の確認

```
select insance_name from v$instance;
```

コンテナ名の確認

```
show con_name
```

PDBの情報を確認

```
show pdbs
```

PDBに接続した状態でSQLファイルの実行

```
@(SQLファイルのパス)
```

スクリプトを実行

```
start (SQLスクリプト)
```

PDBを自動起動させる  
以下のコマンドは、現在のPDB起動状態をセーブするコマンドであるため、自動起動させたいPDBが停止している状態で実行しても反映されないため注意

```
alter pluggable database all save state;
```

グローバルポートの設定

```
exec dbms_xdb_config.SetGlobalPortEnabled(TRUE)
```

PDBをcloseする

```
alter pluggable database (PDB名) close;
```

restrictedモードでPDBを起動

```
alter pluggable database (PDB名) open restricted;
```

PDB名変更

```
alter pluggable database rename global_name to (変更後PDB名);
```

データファイルの位置を確認

```
select file_name from dba_daa_file;
```

PDB作成

```
create pluggable database (新規作成するPDB名) admin user (ユーザー名) identified by (パスワード) 
file_name_convert = ('データファイルの場所','データがいるの場所/新規作成するPDB名');
```

Oracleに空文字はない、勝手にNULLに変換する
