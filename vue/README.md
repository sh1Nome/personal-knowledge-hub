# 2つのAPIスタイル
## Options API
* 比較的簡単
* オブジェクト指向プログラミング経験者には理解しやすい

## Composition API
* 比較的難しい
* より自由度が高い

# 導入
## SFC
* 拡張子`.vue`
* ビルドステップが必要
* VSCodeの拡張機能を使うことで、シンタックスハイライト、コード保管、フォーマットを利用可能

## CDN
* 拡張子`.html`
* ビルドステップが不要

# おすすめ
|複雑性|MPA|SPA|
|:-:|:-:|:-:|
|低|Options API × 非SFC|Options API × SFC|
|高|Composition API × 非SFC|Composition API × SFC|