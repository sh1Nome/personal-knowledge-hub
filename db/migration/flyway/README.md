# 前提
SpringBoot 3.2.4

# 導入方法
`build.gradle`に以下を記載して導入<br>
```
  implementation 'org.flywaydb:flyway-core'
  implementation 'org.flywaydb:flyway-mysql'
```

# メモ
### スキーマ定義ファイル配置場所
```
src\main\resources\db\migration
```

### スキーマ定義ファイル命名規則
```
V(バージョン)__(自由).sql
```

### スキーマ定義ファイル実行タイミング
SpringBootアプリケーション実行時<br>

### すでに実行済みスキーマ定義ファイルを変更したときの挙動
* ファイル削除
  * エラーなし
  * スキーマ定義に変更なし

* スキーマ定義変更
  * エラー

# 参考
* [Zenn - なんとなく使わないFlyway](https://zenn.dev/mako_makok/articles/use-flyway-migration)
