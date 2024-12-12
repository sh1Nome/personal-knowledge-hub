# 周辺デバイス
* HHKB Professional Hybrid Type-S
* 打ち箸
* Shokz OpenRun
* EarPods 3.5mm
* Logicool G304
* Anker 4-Port Ultra-Slim USB-A (USB3.0対応) ハブ
* tp-link UB500 Bluetooth 5.3 ナノUSBアダプター

## 接続図
```mermaid
graph LR
    pc[PC]
    hhkb[HHKB]
    shokz[Shokz]
    earpods[EarPods]
    g304[G304]
    g304adapter[専用アダプター]
    usbhub[USBハブ]
    bluetooth[Bluetoothアダプター]

    earpods --> pc

    usbhub --> pc

    g304adapter & bluetooth --> usbhub
    hhkb -.->|無線接続が安定しない場合| usbhub

    g304 -->|無線| g304adapter
    hhkb & shokz -->|無線| bluetooth
```

## UB500使用時の注意点
* Windowsの場合、デバイスマネージャーから既存のBluetoothデバイスを無効化すること
* [ドライバー](https://www.tp-link.com/jp/support/download/)が必要な場合ダウンロードすること

## HHKB設定
DIPスイッチは2のみオン  
![](./img/hhkb/standard.png)  
![](./img/hhkb/fn.png)  
![](./img/hhkb/pairing.png)

## Shokz操作
* 電源のオンオフ
    * 音量`+`ボタン長押し
* ペアリングモード開始
    * 音量`+`ボタンさらに長押し
* マルチポイントペアリング開始
    * ペアリングモードで音量`+`ボタンとマルチファンクションボタン長押し
* マルチペアリングモードの終了
    * ペアリングモードで音量`-`ボタンとマルチファンクションボタン長押し
* 再生/一時停止/応答
    * マルチファンクションボタン1回
* 次へ
    * マルチファンクションボタン2回
* 前へ
    * マルチファンクションボタン3回
