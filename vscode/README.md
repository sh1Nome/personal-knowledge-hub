# VSCode導入手順
1. 以下からインストーラを入手、実行
    - [VSCode公式](https://code.visualstudio.com/download)

# 拡張機能
* Remote Development：リモート作業ができるようになる
* Dev Containers：コンテナの中でVSCodeが使える
* Emmet：HTMLひな形生成ができるようになる、初期から入ってる
* Vim：Vimが使える
* Prettier：コードフォーマッター
* Japanese Language Pack for Visual Studio Code：日本語化
* Rainbow Csv：CSVが見やすくなる
* Markdown Preview Enhanced：MDが見やすくなる
* Extension Pack for Java：Java関係
* Spring Boot Extension Pack：STSとか
* Gradle for Java：Gradleサポート

# 設定
### setting.json
コマンドパレットで`Open Settings`と検索すると開ける<br>
```
{
    "terminal.integrated.defaultProfile.linux": "bash",
    "terminal.integrated.mouseWheelScrollSensitivity": 0.3,
    "java.jdt.ls.java.home": "C:\\jdk\\jdk-17.0.10+7",
    "emmet.variables": {
        "lang": "ja"
    },
    "editor.renderWhitespace": "all",
    "workbench.colorTheme": "Default High Contrast",
    "redhat.telemetry.enabled": false,
    "diffEditor.ignoreTrimWhitespace": false,
    "vim.useSystemClipboard": true,
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vacode",
    "java.debug.settings.hotCodeReplace": "auto"
}
```