# 周辺デバイス
* HHKB Professional Hybrid Type-S
* USB接続ケーブル(TypeC - A L字)
* 打ち箸
* Shokz OpenRun
* EarPods 3.5mm
* Logicool G304
* Anker 4-Port Ultra-Slim USB-A (USB3.0対応) ハブ
* PC
* Google Pixel 7a

## 接続図
```mermaid
graph RL
    pc[PC]
    pixel[Pixel 7a]
    hhkb[HHKB]
    lcable[L字ケーブル]
    shokz[Shokz]
    earpods[EarPods]
    g304[G304]
    g304adapter[専用アダプター]
    usbhub[USBハブ]

    earpods --> pc

    usbhub --> pc

    hhkb --> lcable --> usbhub

    g304 -.-> g304adapter --> usbhub

    shokz -.-> pixel
```

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
