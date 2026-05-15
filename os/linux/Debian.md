# Debian

メイン端末をFedoraに移行したので最近は使っていない。

## インストール・セットアップメモ

- ISO イメージのダウンロードと検証
  - jaist 等のミラーから ISO を取得
  - `sha256sum`でハッシュ値を計算し、公式 SHA256SUMS と一致するか確認
    - sha256sum: ISOイメージファイルの整合性を検証する。ダウンロード中の破損や改ざんがないかを確認
  - SHA256SUMS と署名ファイル（.sign）を取得し、Debian 公式公開鍵で`gpg --verify`して検証
    - gpg: チェックサムファイル（SHA256SUMS）自体が正規のものであることを検証する。公式の署名により、チェックサムファイルの信頼性を確保
- グラフィックインストーラーの主な設定
  - パーティショニング: LVM 有効化、全ファイルを 1 パーティションに
  - ファイルシステム: ext4
  - パッケージ: Debian デスクトップ環境と Xfce のみ
  - ブートローダー: `/dev/sda`に GRUB をインストール
- 追加・変更したアプリ・設定
  - インストール
    - fcitx5
    - fcitx5-mozc
    - wezterm
    - git
    - chrome
    - vscode
    - vim-gtk3
    - docker
    - mise
    - ffmpeg
    - bash-completion
    - xclip
    - xcape
    - blueman
    - rfkill
    - systemd-timesyncd
    - build-essential
  - キーボードショートカット（本当はdotfilesで管理したいけど、いい方法が思いつかなくて妥協）
    - アプリケーションショートカット
      - xfce4-popup-whiskermenu : `Alt + F1`（xcapeにより実質Superキー）
      - xflock4: `Super + L`
      - xfce4-clipman-history: `Super + V`
      - 音量（[device](../../device/README.md)を参照）
        - `sh -c 'pactl set-sink-mute @DEFAULT_SINK@ false && pactl set-sink-volume @DEFAULT_SINK@ +5%'`: `AudioRaiseVolume`
        - `sh -c 'pactl set-sink-mute @DEFAULT_SINK@ false && pactl set-sink-volume @DEFAULT_SINK@ -5%'`: `AudioLowerVolume`
    - ウィンドウマネージャー
      - ウィンドウを最大化: `Super + Up`
      - ウィンドウを隠す: `Super + Down`
      - ウィンドウを画面左にタイル表示: `Super + Left`
      - ウィンドウを画面右にタイル表示: `Super + Right`
  - パネルは1つだけ（下に表示、行サイズ35px）
    - Whiskermenu
    - システム負荷モニター
    - 最新の天気
    - ウィンドウボタン
    - セパレーター（拡張あり）
    - ステータストレイプラグイン
      - ネットワーク接続
      - Bluetoothマネージャー
      - Fcitx5設定
    - Clipman
    - PulseAudioプラグイン
    - 電源管理プラグイン
    - 時計
    - デスクトップ通知プラグイン
  - ウィンドウマネージャー（詳細）
    - アクセシビリティ
      - 「いずれかのマウスボタンが押されている時にウィンドウを前面に出す」をオフ
  - セッションと起動
    - 自動開始アプリケーション
      - xcape（Superキーを単独で押したときにAlt+F1とする）
        - `xcape -e 'Super_L=Alt_L|F1'`
  - Bluetooth: `rfkill unblock bluetooth`後、bluetoothctl でペアリング・信頼設定（bluemanも導入済み）
    1. `rfkill unblock bluetooth`
    1. `bluetoochctl`
       1. `power on`
       1. `agent on`
       1. `default-agent`
       1. `scan on`
       1. `pair (mac)`
       1. `scan off`
       1. `trust (mac)`
       1. `info (mac)`
  - マウスとタッチパッド
    - タッチパッド
      - 「タッチパッドでタップをクリック」を有効化
      - クリック方法は「1、2、3本の指を左クリック、右クリック、中クリックとして使用する」を選択
      - 「アダプティブポインターの加速」を無効化
  - 時計: `timedatectl set-ntp true`で NTP 有効化
  - ビープ音: `echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf`で無効化
- xfce4の設定の初期化方法
  - GUIから設定できるものは`~/.config/xfce4/xfconf/xfce-perchannel-xml`にある

