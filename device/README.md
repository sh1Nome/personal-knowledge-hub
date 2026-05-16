# 周辺デバイス
* ~~HHKB Professional Hybrid Type-S~~
* HHKB Studio
* USB接続ケーブル(TypeC - A L字)
* 打ち箸
* Shokz OpenRun
* EarPods 3.5mm
* Logicool G304
* Xbox 純正コントローラー
* ~~Anker 4-Port Ultra-Slim USB-A (USB3.0対応) ハブ~~
* PC
* ChromeBook
* Google Pixel 7a

## 接続図
```mermaid
graph RL
    pc[メインPC]
    chromebook[ChromeBook]
    pixel[Pixel 7a]
    hhkb[HHKB]
    shokz[Shokz]
    earpods[EarPods]
    g304[G304]
    xbox[箱コン]

    earpods --> pc
    hhkb -->|USB接続| pc
    g304 --> pc
    xbox --> pc

    shokz --> pixel
    hhkb -->|Bluetooth接続| chromebook
```

## HHKB設定
### Professional Hybrid Type-S
DIPスイッチは2のみオン  
![](./img/hhkb_type_s/standard.png)  
![](./img/hhkb_type_s/fn.png)  
![](./img/hhkb_type_s/pairing.png)

### Studio
![](./img/hhkb_studio/default.png)  
![](./img/hhkb_studio/fn1.png)  
![](./img/hhkb_studio/fn2.png)

#### IMEのオンオフ
キーマップ変更ツールでかな／英数キーを割り当てることでLang1／Lang2を割り当てることができる。  
[WindowsのIME](https://learn.microsoft.com/ja-jp/windows-hardware/design/component-guidelines/keyboard-japan-ime)ではLang1がIMEオン、Lang2がIMEオフとなっている。

#### F2レイヤー
* WASD
    * `Win + ← or ↓ or ↑ or →`に設定
    * 画面の分割や最大化を行いやすくするため
* F13キーの追加
    * OBSのリプレイバッファに割り当てている
* V
    * `Win + Ctrl + v`で音量ミキサーを開けるようにしている
* F
    * `Win + Shift + d`でPowerToysのマウスジャンプを起動する

