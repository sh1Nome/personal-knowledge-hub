# SQL

## DDL（Data Definition Language）
データベースやテーブルなどの構造を定義する言語

### CREATE
データベース、テーブル、インデックスなどを作成する

* データベースを作成
    * `CREATE DATABASE (データベース名);`
* テーブルを作成
    ```sql
    CREATE TABLE users (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(100)
    );
    ```

### ALTER
既存のテーブル構造を変更する

* カラムを追加
    * `ALTER TABLE (テーブル名) ADD (カラム名) (データ型);`
* カラムを変更
    * `ALTER TABLE (テーブル名) MODIFY (カラム名) (データ型);`
* カラムを削除
    * `ALTER TABLE (テーブル名) DROP COLUMN (カラム名);`

### DROP
データベース、テーブル、インデックスなどを削除する

* テーブルを削除
    * `DROP TABLE (テーブル名);`
* データベースを削除
    * `DROP DATABASE (データベース名);`

## DCL（Data Control Language）
データベースへのアクセス権限を制御する言語

### GRANT
ユーザーに権限を付与する

* すべての権限を付与
    * `GRANT ALL PRIVILEGES ON (データベース名).* TO '(ユーザー名)'@'(ホスト名)';`
* SELECT権限を付与
    * `GRANT SELECT ON (データベース名).(テーブル名) TO '(ユーザー名)'@'(ホスト名)';`
* 複数の権限を付与
    * `GRANT SELECT, INSERT, UPDATE ON (データベース名).* TO '(ユーザー名)'@'(ホスト名)';`

## DML（Data Manipulation Language）
データの操作を行う言語

### INSERT
テーブルにデータを挿入する

* 1行挿入
    * `INSERT INTO (テーブル名) (カラム1, カラム2) VALUES (値1, 値2);`
* 複数行挿入
    ```sql
    INSERT INTO users (name, email) VALUES
        ('田中', 'tanaka@example.com'),
        ('佐藤', 'sato@example.com');
    ```

### SELECT
テーブルからデータを取得する

* すべてのカラムを取得
    * `SELECT * FROM (テーブル名);`
* 特定のカラムを取得
    * `SELECT (カラム1), (カラム2) FROM (テーブル名);`
* 条件を指定して取得
    * `SELECT * FROM (テーブル名) WHERE (カラム名) = (値);`
* 並び替えて取得
    * `SELECT * FROM (テーブル名) ORDER BY (カラム名) ASC;`
* 件数を制限して取得
    * `SELECT * FROM (テーブル名) LIMIT (件数);`
* 集約関数を使用
    * `SELECT COUNT(*), AVG(age) FROM (テーブル名);`
* グループ化
    * `SELECT (カラム名), COUNT(*) FROM (テーブル名) GROUP BY (カラム名);`
* テーブルを結合
    * `SELECT * FROM (テーブル1) JOIN (テーブル2) ON (テーブル1.カラム) = (テーブル2.カラム);`

### UPDATE
テーブルのデータを更新する

* 条件を指定して更新
    * `UPDATE (テーブル名) SET (カラム名) = (値) WHERE (条件);`
* 複数のカラムを更新
    * `UPDATE (テーブル名) SET (カラム1) = (値1), (カラム2) = (値2) WHERE (条件);`

### DELETE
テーブルからデータを削除する

* 条件を指定して削除
    * `DELETE FROM (テーブル名) WHERE (条件);`
* すべてのデータを削除
    * `DELETE FROM (テーブル名);`
    * `TRUNCATE TABLE (テーブル名);` も使用可能（より高速）
