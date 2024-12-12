# SpringBoot
SpringFrameworkをもとにしたフレームワーク。<br>
SpringFrameworkとの違い<br>
- アプリケーションサーバが内包される
- SpringFrameworkに必要な設定が自動でされる
    - 実際には `@SpringBootApplication` で実装されている模様

[Spring Initializr](https://start.spring.io/)：SpringBootのプロジェクトを作れるサイト

### 依存関係
Spring Boot DevTools：開発用ツール<br>
Spring Web：Spring MVCとTomcat<br>
Spring Data JDBC：JDBC<br>
MySQL Driver：MySQL用<br>
lombok： `getter` や `setter` などを自動設定<br>
Thymeleaf：テンプレートエンジン<br>
Thymeleaf Layout Dialect：レイアウト化用<br>

### Spring Initializr
[Spring Initializr](https://start.spring.io/)

### build.gradle
`build.gradle_templete`を参照<br>

### application.properties
`application.properties_templete`を参照<br>
[アプリケーションプロパティ設定一覧 - 公式](https://spring.pleiades.io/spring-boot/docs/current/reference/html/application-properties.html)<br>