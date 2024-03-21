# SpringFramework
参考書籍
- Spring徹底入門
- SpringFramework超入門 やさしくわかるWebアプリ開発

## 重要な概念
DIによりクラスのインスタンス生成と依存関係をコードから排除できる。<br>
AOPにより、インスタンスに外部から共通的な機能を入れ込むことができる。<br>

### DI（依存性の注入）
あるクラスに必要となるコンポーネントを設定することを「依存性を注入（DI）する」という。<br>
DIを自動的に行ってくれる基盤を「DIコンテナ」とよぶ。<br>
Configuration（Bean定義）を使用してDIコンテナにコンポーネント（Bean）を登録する。<br>
DIコンテナからBeanを取得することを「ルックアップ」とよぶ。<br>
<br>
Bean定義方法は3つある。<br>
「①or②」and③を用いるパターンが多い。<br>

#### ①Javaベース
`@Configuration`をつけることでConfigurationクラスとして読み込まれる。<br>
Configurationクラスのメソッドに`@Bean`を付けることでBeanをDIコンテナに登録できる。<br>
`@Bean`を付けたメソッドのメソッド名がBean名、戻り値がBeanのインスタンスとして定義される。<br>
`@Bean(name = "Bean名")`とすることでもBean名の設定が可能。<br>
Bean名は実装名ではなく用途名を付けるべき。Beanの実装変更時のメンテナンスが楽であるため。<br>
`@Bean`を付けたメソッドに追加で`@Primary`を付けることで、デフォルトでオートワイヤリングされるBeanとして設定される。<br>
`@ComponentScan`を設定することでパッケージ内のコンポーネントをスキャンし読み込める。<br>
スキャンにはフィルタの利用も可能。<br>
`@Import({クラス名1.class, クラス名2.class})`とすることで別で定義したConfigrationクラスを読み込むことが可能。<br>これにより、Configrationクラスの分割ができる。<br>

#### ②XMLベース
割愛<br>

#### ③アノテーションベース
Configurationクラスに`@ComponentScan("パッケージ名")`がある場合、パッケージ名以下のコンポーネントをスキャンしてDIコンテナにBeanを登録する。<br>
コンポーネントスキャンで登録されるBean（クラス）には特定のアノテーションを付ける。<br>
スキャン対象のアノテーションは以下などがある。<br>
`@Controller`：MVCのC<br>
`@Service`：ビジネスロジック<br>
`@Repository`：データの永続化にかかわる処理を実装<br>
`@Component`：上記3つに当てはまらない場合<br>
<br>
ほかのコンポーネントを参照する際は、`@Autowired`を付ける。<br>
`@Autowired`は型により参照されているため、同じ型のBeanが複数ある場合解決できない。<br>
追加でBean名を指定するときは`@Qualifier("Bean名")`も付ける。<br>
インターフェースを`@Autowired`すると自動的に実装クラスをインスタンス化する。<br>
`@Resouce`により名前によるオートワイヤリングができるが、挙動が複雑なため割愛。<br>
同じ型のBeanをListやMapでオートワイヤリングすることも可能。<br>
<br>

DIコンテナはスコープの管理もしてくれる。これによりスコープを管理するための処理を記述する必要がなくなる。<br>

#### スコープ
`@Scope("スコープ")`で設定可能。<br>
- singleton：DIコンテナの起動時に一度生成、次回以降は同じものを使う。
- session：Webアプリケーション用
- request：Webアプリケーション用
- application：Webアプリケーション用

設定をしなかった場合`singleton`になる。<br>
`@RequestScope`や`@SessionScope`も利用できる。<br>

異なるスコープ間でインジェクションすると大きいスコープに合わせられる。<br>
設定したスコープでインジェクションしたい場合は、以下のアノテーションを設定する。<br>
`@Scope(value = "スコープ", proxyMode = ScopeProxyMode.INTERFACES)`<br>
<br>
設定したスコープでインジェクションする方法は、他にも`@Lookup`などがあるが割愛。<br>
また、カスタムスコープの作成も可能。<br>

### AOP（アスペクト指向プログラミング）
複数のクラスに点在する共通の処理を中心に設計や実装を行うプログラミング手法。<br>
AOPはSpringの域を超えた概念だが、ここにはSpring特化の内容を記述。<br>

#### 概念用語
**Aspect**<br>
共通の処理そのもの。<br>
例）ログを出力する。<br>
<br>
**Join Point**<br>
共通の処理を実行するタイミング。<br>
例）メソッド実行時。<br>
<br>
**Advice**<br>
共通の処理の実装部分。Join Pointごとに実装<br>
- Before：実行前
- After Returning：実行後正常終了時
- After Throwing：実行後例外発生時
- After：実行後無条件
- Around：実行前後
<br>

**Pointcut**<br>
Join Pointのグループ。<br>
<br>
**Weaving**<br>
アプリケーションコードの適切な場所にAspectを入れ込む処理。<br>
<br>
**Target**<br>
AOP処理によって変更されたオブジェクトのこと。Advicedオブジェクトともいう。<br>
<br>


#### SpringAOPを使うために
依存ライブラリに以下を追加し、Configurationクラスに`@EnableAspectJAutoProxy`を設定。<br>
メソッド情報は`org.aspectj.lang.JoinPoint`オブジェクトから取得可能。<br>

```
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-aop</artifactId>
</dependency>
<dependency>
    <groupId>org.aspectj</groupId>
    <artifactId>aspectjweaver</artifactId>
</dependency>
```

#### Adviceの実装方法
**Before**<br>
メソッドに`@Before("Pointcut式")`を設定。<br>
<br>
**After Returning**<br>
メソッドに`@AfterReturning("Pointcut式")`を設定。<br>
戻り値を利用する場合は以下のようにする。<br>

```
@AfterReturning(value = "Pointcut式", returning = "引数名")
```
<br>

**After Throwing**<br>
メソッドに以下を設定。<br>

```
@AfterThrowing(value="Pointcut式", throwing = "e")
```
<br>

**After**<br>
メソッドに`@After("Pointcut式")`を設定。<br>
<br>
**Around**<br>
メソッドに`@Around("Pointcut式")`を設定。<br>
Aroundは特殊で対象メソッドの実行も処理として記述する。<br>
`Object result = jp.proceed();`

#### Pointcut式
**メソッド名で指定**<br>
`execution(戻り値 パッケージ.クラス名.メソッド名(引数))`<br>
ワイルドカードの利用が可能。<br>
- `*`：任意の1以上。
- `..`：任意の0以上。
- `+`：クラス名の後に指定。そのクラスを含むサブクラス、実装クラスを設定。
<br>

例）serviceパッケージ直下の任意のメソッド<br>
`execution(* com.example.service.*.*(..))`<br>
例）serviceパッケージ以下の任意のメソッド<br>
`execution(* com.example.service..*.*(..))`<br>

**型で指定**<br>
`within(パッケージ名.クラス名)`<br>

**Pointcut式の再利用**<br>
任意のPointcut式に名前を付けて再利用可能。<br>
戻り値が`void`のメソッドに以下を設定。<br>
`@Pointcut("Pointcut式")`<br>
上記を設定したメソッド名をPointcut式として扱える。<br>

## Springの機能

### データバインディング
データバインディングは、外部から指定された入力値をJavaBeansのプロパティに設定すること。<br>
リクエストのパラメータをJavaBeansにバインドする例を以下に示す。<br>
`EmployeeForm`はJavaBeans。<br>
<br>
例1）Springのデータバインディング機能を使わない。<br>

```
EmployeeForm form = new EmployeeForm();
form.setName(request.getParameter("name"));
form.setJoinedYear(Integer.valueOf(request.getParameter("joinedYear)));
```

例2）Springのデータバインディング機能を使う。<br>

```
EmployeeForm form = new EmployeeForm();
ServletRequestDataBinder detaBinder = new ServletRequestDataBinder(form);
detaBinder.bind(request);
```

Springのデータバインディング機能を使うことで、setterをひとつひとつ呼ぶ手間や、型変換をする手間をすべて1つの処理にまとめることができる。<br>
また、SpringMVCの機能を使うことで上記処理も必要なくなる。<br>
コントローラーのリクエストをハンドリングするメソッド引数に、JavaBeansを持たせるだけでバインドされる。<br>
`@ModelAttribute` や `@SessionAttributes` で検索。<br>

### プロパティ管理
アプリケーション内で使用する設定値をプロパティファイルを用いて管理することが可能。<br>
プロパティファイルパスはJavaConfigに`PropertySource("ファイルパス")`を付けることで設定可能。<br>
`@Value("$classpath:プロパティファイルパス") 型 変数名`でインジェクション可能。<br>

### メッセージ管理（MessageSource）
Java Configで以下の定義をする。<br>

```
@Bean
public MessageSource messageSource() {
    ResourceBundleMessageSource messageSource = new ResouceBundleMessageSource();
    // クラスパス上に格納されているプロパティファイルパス（拡張子を除く）
    messageSource.setBasenames("messages");
    return messageSource();
}
```

プロパティファイルを作成し、MesssageSourceをオートワイヤリングする。<br>
以下メソッドでメッセージを呼び出せる。<br>
メッセージに埋め込む値（引数）を設定可能。<br>

```
messageSource.getMessage("プロパティキー", new String[]{"引数"}, Locale.Japanese);
```

MessageSourceResolvableを利用することでメッセージに埋め込む値をプロパティファイル化可能。<br>
また、i18nにも対応可能。<br>

## SpringMVC
DIコンテナ上で動作するWebアプリケーションを開発するためのフレームワーク。MVCパターンを採用。<br>
POJO(plain Old Java Object)で実装。<br>
Servlet APIやViewの実装技術を抽象化できる。<br>
アノテーションを使用し、定義情報の指定を行う。<br>

### 依存ライブラリ

```
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
</dependency>
<dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-validator</artifactId>
</dependency>
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>jcl-over-slf4j</artifactId>
</dependency>
<dependency>
    <groupId>ch.qos.logback</groupId>
    <artifactId>logback-classic</artifactId>
</dependency>
```

Hibernate Validator：入力チェック用<br>
SLF4JとLogback：ログ出力用<br>

### 使い方
Configurationクラスに`@EnableWebMvc`を設定すると、SpringMVCに必要なコンポーネントのBean定義が自動で行われる。<br>

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

### build.gradle
```
plugins {
	id 'java'
	id 'war'
	id 'org.springframework.boot' version '3.2.3'
	id 'io.spring.dependency-management' version '1.1.4'
}

group = 'com.example'
version = '0.0.1-SNAPSHOT'

java {
	sourceCompatibility = '17'
}

# lombok
configurations {
  compileOnly {
    extendsFrom annotationProcessor
  }
}

repositories {
	mavenCentral()
}

dependencies {
    # Spring Data JDBC
    implementation 'org.springframework.boot:spring-boot-starter-data-jdbc'
    # Thymeleaf
    implementation 'org.springframework.boot:spring-boot-starter-thymeleaf'
    # Thymeleaf Layout Dialect
    implementation 'nz.net.ultraq.thymeleaf:thymeleaf-layout-dialect'
    # Validation
    implementation 'org.springframework.boot:spring-boot-starter-validation'
    # Spring Web
	implementation 'org.springframework.boot:spring-boot-starter-web'
    # lombok
    compileOnly 'org.projectlombok:lombok'
    # Spring Boot DevTools
	developmentOnly 'org.springframework.boot:spring-boot-devtools'
    # MySQL Driver
    runtimeOnly 'com.mysql:mysql-connector-j'
    # lombok
    annotationProcessor 'org.projectlombok:lombok'
    # Spring Web
	providedRuntime 'org.springframework.boot:spring-boot-starter-tomcat'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
}

tasks.named('test') {
	useJUnitPlatform()
}
```
