# VSCode導入手順
1. 以下からインストーラを入手、実行
    - [VSCode公式](https://code.visualstudio.com/download)

# 拡張機能備忘
* Extension Pack for Java：Java関係
* Spring Boot Extension Pack：STSとか
* Gradle for Java：Gradleサポート
* Japanese Language Pack for Visual Studio Code：日本語化
* Emmet：HTMLひな形生成ができるようになる、初期から入ってる
* Remote Development：リモート作業ができるようになる
* Dev Containers：コンテナの中でVSCodeが使える
* Vim：Vimが使える
* Rainbow Csv：CSVが見やすくなる
* Markdown Preview Enhanced：MDが見やすくなる

# 設定備忘
### setting.json
コマンドパレットで`Open Settings`と検索すると開ける<br>
```
{
    "terminal.integrated.mouseWheelScrollSensitivity": 0.3,
    "java.jdt.ls.java.home": "C:\\jdk\\jdk-17.0.10+7",
    "emmet.variables": {
        "lang": "ja"
    },
    "workbench.colorTheme": "Default High Contrast",
    "editor.renderWhitespace": "all",
    "redhat.telemetry.enabled": false,
    "diffEditor.ignoreTrimWhitespace": false
    "markdown-preview-enhanced.previewTheme": "github-dark.css",
    "vim.useSystemClipboard": true
}
```