# Fedora

DebianからFedoraに乗り換えた。  
理由は以下の通り。

* aptよりdnfのほうが好み
* デフォルトのセキュリティ設定が堅牢
    * SELinux, Firewall

## インストール・セットアップメモ

* ISOのダウンロードと検証
    * 公式からISO, CHECKSUM, .gpgを取得
    * gpgでCHECKSUMを検証
    * sha256でISOを検証しCHECKSUMと照合
* 追加・変更したアプリ・設定
    * インストール
        * wezterm
        * mozc
        * fcitx5
        * xclip
        * gcc
        * make
        * libX11-devel
        * libXtst-devel
        * xcape（ビルド）
        * git
        * mise
        * chezmoi
        * chrome
        * docker
        * vscode
    * アンインストール
        * ibus
    * キーボードショートカット（本当はdotfilesで管理したいけど、いい方法が思いつかなくて妥協）
        * アプリケーションショートカット
            * xfce4-popup-whiskermenu : `Alt + F1`（xcapeにより実質Superキー）
            * xflock4: `Super + L`
            * xfce4-clipman-history: `Super + V`
            * 音量（[device](../../device/README.md)を参照）
                * `sh -c 'pactl set-sink-mute @DEFAULT_SINK@ false && pactl set-sink-volume @DEFAULT_SINK@ +5%'`: `AudioRaiseVolume`
                * `sh -c 'pactl set-sink-mute @DEFAULT_SINK@ false && pactl set-sink-volume @DEFAULT_SINK@ -5%'`: `AudioLowerVolume`
        * ウィンドウマネージャー
            * ウィンドウを最大化: `Super + Up`
            * ウィンドウを隠す: `Super + Down`
            * ウィンドウを画面左にタイル表示: `Super + Left`
            * ウィンドウを画面右にタイル表示: `Super + Right`
    * ウィンドウマネージャー（詳細）
        * アクセシビリティ
            * 「いずれかのマウスボタンが押されている時にウィンドウを前面に出す」をオフ
    * パネルは1つだけ（下に表示、行サイズ35px）
        * Whiskermenu
        * システム負荷モニター
        * 最新の天気
        * ウィンドウボタン
        * セパレーター（拡張あり）
        * ステータストレイプラグイン
            * ネットワーク接続
            * Bluetoothマネージャー
            * Fcitx5設定
        * Clipman
        * PulseAudioプラグイン
        * 電源管理プラグイン
        * 時計
        * デスクトップ通知プラグイン
    * セッションと起動
        * 自動開始アプリケーション
            * xcape（Superキーを単独で押したときにAlt+F1とする）
                * `xcape -e 'Super_L=Alt_L|F1'`
    * マウスとタッチパッド
        * タッチパッド
            * 「タッチパッドでタップをクリック」を有効化
            * クリック方法は「1、2、3本の指を左クリック、右クリック、中クリックとして使用する」を選択
            * 「アダプティブポインターの加速」を無効化
        * マウス
            * 「アダプティブポインターの加速」を無効化
    * ビープ音: `echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf`で無効化
* xfce4の設定の初期化方法
    * GUIから設定できるものは`~/.config/xfce4/xfconf/xfce-perchannel-xml`にある
