# チートシート
## 操作
### ブランチ関連
* ブランチを作成
    * `git branch (ブランチ名)`
* 特定のタグ／ブランチからブランチを作成
    * `git branch (ブランチ名) (派生元タグ／ブランチ名)`
* ローカルブランチの一覧
    * `git branch`
* すべてのブランチを表示
    * `git branch -a`
* ブランチの詳細（追跡先や最新コミットメッセージ）を表示
    * `git branch -vv`
* 現在のブランチの名前を変更
    * `git branch -m (ブランチ名)`
* ブランチを強制削除
    * `git branch -D (ブランチ名)`
* 現在のブランチ以外を削除
    * `git branch | xargs git branch -D`
* チェックアウト
    * `git checkout (ブランチ名)`
* ブランチを作成してチェックアウト
    * `git checkout -b (ブランチ名)`


### リモート関連
* リモートブランチの一覧
    * `git branch --remote`
* フェッチ
    * `git fetch --prune`
    * `git fetch --prune-tags`
* プル
    * `git pull --prune`
* プッシュ
    * `git push`
    * `git push origin (タグ名)`
* 強制プッシュ
    * `git push -f`
* upstreamを設定してプッシュ
    * `git push --set-upstream origin (ブランチ名)`
    * `git push -u origin (ブランチ名)` は上記の略
* 現在のブランチのupstreamを解除
    * `git branch --unset-upstream`
* リモートブランチの削除
    * `git push --delete origin (ブランチ名)`

### コミット関連
* ステージング前のファイルの変更を取り消し
    * `git restore (ファイルパス)`
* 特定のファイルをステージング
    * `git add (ファイルパス)`
* 変更のあるすべてのファイルをステージング
    * `git add --all`
* 対話的にファイルの一部をステージング（行ごと）
    * `git add -p`
    * ステージング対象の差分ごとにプロンプトが表示される
    * `y`: ステージング対象として追加
    * `n`: 追加しない
    * `s`: 差分を更に分割（小さい単位に）
    * `e`: 手動で編集
* ステージングをすべて解除
    * `git reset HEAD`
* ステージングから特定のファイルを解除
    * `git reset HEAD (ファイルパス)`
    * `git restore --staged (ファイルパス)`
* コミット
    * `git commit`
* ファイルをgit管理から除外（ワーキングディレクトリからも削除）
    * `git rm (ファイル名)`
* 直前のコミットメッセージを修正
    * `git commit --amend`
* コミットをまとめる（インタラクティブリベース）
    * `git rebase -i (HEAD~3など)`
        * pickにsquashをまとめる, rewordでコミットメッセージを編集する
        * dropでコミットを削除できる

### スタッシュ
* ステージング済みの変更をスタッシュに移動
    * `git stash push`
* スタッシュを一覧表示
    * `git stash list`
* スタッシュをステージングに戻す
    * `git stash pop (スタッシュ名)`
* スタッシュを削除
    * `git stash drop (スタッシュ名)`

### 差分
* コミットAからコミットBにするために必要な差分
    * `git diff (コミットA)..(コミットB)`
* コミットAとコミットBの共通の祖先から、コミットBに加えられた差分
    * `git diff (コミットA)...(コミットB)`
* コミットAとコミットBの共通の祖先から、コミットBに加えられた差分のうち指定したファイルのみを表示
    * `git diff (コミットA)...(コミットB) (ファイル名)`
* 別世代の別ファイルを比較する
    * `git diff (コミットA):(ファイルA) (コミットB):(ファイルB)`
        * `git diff HEAD~1:hoge.md fuga.md`で1世代前のhoge.mdと今のfuga.mdを比較する
* ステージング前の差分
    * `git diff`
* ステージング後の差分
    * `git diff --cached`
* ローカルブランチとリモートブランチの差分
    * `git diff @{upstream} HEAD`
* 差分ツールで使える一覧
    * git difftool --tool-help
* 差分ツールを指定して開く
    * git difftool --tool (ツール名)

#### git diffの詳細な動作例
同じブランチから派生したxブランチとyブランチがある場合:
* xブランチではファイルhogeを追加しコミット
* yブランチではファイルfugaを追加しコミット

このとき`git diff`は以下のようになる:
* `git diff x..y`: xからyへの変更。hogeの削除とfugaの追加が表示される
* `git diff x...y`: xとyの共通の祖先からyへの変更。fugaの追加のみが表示される

注意: GitHubのプルリクエストに表示される差分は`git diff base...head`と同等

### ログ
* コミットログ
    * `git log`
* 最新のn件のコミットログを表示
    * `git log -n (n)`
* コミットメッセージで絞り込み
    * `git log --grep (検索文字列)`
* 特定のコミットハッシュから最新のn件のコミットログを表示
    * `git log (コミットハッシュ) -n (n)`
* コミットログを1行で出力
    * `git log --oneline`
* コミットログをグラフ表示
    * `git log --graph`
* 特定のファイルのコミットログ
    * `git log --follow (ファイルパス)`
* 差分に特定の文字列が含まれるコミットを検索
    * `git log -G 'hoge' -i`
        * 差分にhogeが含まれるものを大文字小文字を無視して検索
* ファイル名などのサマリ情報も表示
    * `git log --summary`
* ファイル名に特定の文字列が含まれているログ
    * `git log --summary -- ":(icase)*hoge*"`
        * ファイル名にhogeが含まれているログを大文字小文字を無視して検索
* 特定のコミットの詳細
    * `git show (コミット)`
* 特定のコミットで変更されたファイル名だけ出力
    * `git show --name-only (ハッシュ)`
* 特定のコミットの特定のファイルの内容を表示
    * `git show (コミット) -- (ファイルパス)` または `git show (コミット):(パス)`
    * 差分ではなくファイル全体の内容を表示する場合は `:` 形式を使用
* コミット範囲のログを表示
    * `git log (コミット)...(コミット)`
* マージコミットに含まれるコミットを確認
    * `git log (マージコミット)^...(マージコミット)`
* 操作のログ
    * `git reflog`
* 行単位のログ
    * `git blame (ファイルパス)`
    * `git blame -L (開始行),(終了行) (ファイルパス)`

### reset
* `git reset --soft (コミット)`
    * 指定したコミットにHEADを移動し、差分をステージング状態にする
* `git reset --mixed (コミット)`
    * 指定したコミットにHEADを移動し、差分のステージングを解除する（デフォルト動作）
* `git reset --hard (コミット)`
    * 指定したコミットにHEADを移動し、差分の変更を削除する

### revert
* `git revert (コミット)`
    * 特定のコミットを打ち消すコミットを作成する
* `git revert (コミットA)..(コミットB)`
    * コミットAからコミットBまでを打ち消すコミットを作成する
* `git revert --no-commit (コミットA)..(コミットB)`
    * コミットAからコミットBまでを打ち消すコミットを作成する（コミットは自動的に作らない）

### サブモジュール
* 追加する
    * `git submodule add (追加するリポジトリのURL) (パス)`
* 親プロジェクトが期待する状態に更新する
    * `git submodule update --init`

### タグ
* ローカルのタグの一覧
    * `git tag`
* 注釈付きのタグの作成
    * `git tag -a (タグ名)`
* ローカルのタグを削除
    * `git tag -d (タグ名)`
* リモートのタグの一覧
    * `git ls-remote --tags origin`
* リモートのタグの削除
    * `git push --delete origin tag (タグ名)`

### その他
* 情報を表示
    * `git status`
* クローン
    * `git clone (URL)`
* 浅いクローン
    * `git clone --depth (深さ) (URL)`
* 現在のブランチにマージ（マージコミットを必ず作成する）
    * `git merge --no-ff (ブランチ名)`
* コミットをまとめた上で現在のブランチにマージ（コミットされずステージングされた状態）
    * `git merge --squash (ブランチ名)`
        * 履歴（マージコミット）が残らず、後で差分が出やすくなるので注意。
* マージを中止する
    * `git merge --abort`
* マージツールを起動してコンフリクトを解決
    * `git mergetool`
    * `git mergetool --tool-help` で利用可能なマージツールの一覧を表示
    * `git mergetool --tool=(ツール名)` で特定のマージツールを使用
* 特定のコミットを現在のブランチに適用
    * `git cherry-pick (コミット)`
* ローカルのファイルは残したままgit管理から除外
    * `git rm --cached （ファイルパス)`
* リモートブランチのURLと名称を確認
    * `git remote -v`
* リポジトリを作成
    * `git init`
* 初期ブランチをmainに指定しつつ初期化
    * `git init -b main`
* リモートリポジトリを設定
    * `git remote add origin (url)`
* リモートリポジトリのURLを変更
    * `git remote set-url origin (url)`
* 問題のあるコミットを見つける（二分探索）
    * `git bisect`
* リポジトリ内のテキストを検索
    * `git grep (検索文字列)`
* 大文字小文字を区別せずに検索
    * `git grep -i (検索文字列)`
* ページャーを使わない
    * `git --no-pager`

## 設定
* ユーザー設定を変更する
    * `git config --global (設定名) (設定値)`
* ユーザー設定をリセットする
    * `git config --global --unset (設定名)`
* 設定の一覧
    * `git config --list --global`
* 設定値の確認
    * `git config get (設定名)`

## contribディレクトリ
コミュニティが寄贈したスクリプトやツールを格納するディレクトリ。手動でインストールする必要があり、公式サポート外です。

## 用語
* ブランチ・タグは特定のコミットの参照
