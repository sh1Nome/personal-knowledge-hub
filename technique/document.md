# ドキュメント

説明変数を使う。  
なるべく受動態を使わない。

## 設計書
設計書からテストを作成できるように書く。  
画面名や機能名を適切に使う。  
以下は見出しを分けて書く。
* UI
* 制御・処理

## テストケース
### 準備
テスト環境とテスト観点を明らかにする。  

### 作成
テスト観点ごとに作成する。  
前提・操作・期待値を明らかにする。

## mermaid
テキストでフローチャートなどを表現できるJSのライブラリ、以下はサンプル
```mermaid
flowchart TD
    %% コメント
    start([開始記号])
    method1[処理1]
    if{分岐}
    method2[処理2]
    method3[処理3]
    info[情報]
    finish([終了])

    start --> method1
    method1 --> if
    if -->|yes| method2
    if -->|no| method3
    info -.->|取得| method3
    method2 --> finish
    method3 --> finish
```

