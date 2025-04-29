# 周辺デバイス
* ~~HHKB Professional Hybrid Type-S~~
* HHKB Studio
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
### Professional Hybrid Type-S
DIPスイッチは2のみオン  
![](./img/hhkb_type_s/standard.png)  
![](./img/hhkb_type_s/fn.png)  
![](./img/hhkb_type_s/pairing.png)

### Studio
![](./img/hhkb_studio/default.png)  
![](./img/hhkb_studio/fn1.png)  
![](./img/hhkb_studio/fn2.png)

#### tips
* USB接続に切り替え：`Fn + Ctrl + 0`
    * LEDインジケータ―全体が青く光る
* カーソルの移動速度を変更：`Fn2 + 1~4`
    * LEDインジケーターが`1~4`の対応する位置で光る
    * ひとまず`3`で試している
* プロファイルの切り替え：`Fn + C` → `1~4`
    * LEDインジケーターが`1~4`の対応する位置で光る

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
