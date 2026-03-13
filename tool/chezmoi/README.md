# chezmoi

## コマンド一覧

* `chezmoi init git@github.com:sh1Nome/dotfiles.git` - リポジトリから dotfiles を初期化する
* `chezmoi edit-config` - chezmoi の設定を編集する
* `chezmoi data` - テンプレート用データを表示する
* `chezmoi managed` - 管理下にあるファイル一覧を表示する
* `chezmoi edit ~/.bashrc` - 管理下のファイルを編集する
* `chezmoi chattr +template ~/.bashrc` - ファイル属性を変更する（テンプレート属性を追加）
* `chezmoi chattr -- -template ~/.bashrc` - ファイル属性を変更する（テンプレート属性を削除）
* `chezmoi cat` - ファイルの内容を表示する
* `chezmoi diff` - 適用される変更を確認する
* `chezmoi -v apply` - 変更を適用する（詳細表示）
