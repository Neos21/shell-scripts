Option Explicit

' マウスの左・右クリックを入れ替える
' 
' コントロールパネル → マウス → 「マウスのプロパティ」ウィンドウを開き
' 「主と副ボタンを切り替える」のチェックボックスを押下し「適用」ボタンを押してウィンドウを閉じる

Dim wShell : Set wShell = WScript.CreateObject("WScript.Shell")

' 「マウスのプロパティ」ウィンドウを開く
wShell.Run("control mouse")
WScript.Sleep(500)

' 「マウスのプロパティ」ウィンドウをアクティブにする
wShell.AppActivate("マウスのプロパティ")
WScript.Sleep(500)

' 「主と副ボタンを切り替える」のチェックボックスをショートカットキー `Alt + S` で押下する
wShell.SendKeys("%s")
WScript.Sleep(500)

' 「適用」ボタンをショートカットキー `Alt + A` で押下する
wShell.SendKeys("%a")
WScript.Sleep(500)

' `Alt + F4` で「マウスのプロパティ」ウィンドウを閉じる
wShell.SendKeys("%{F4}")
WScript.Sleep(500)

' Alt-IME-AHK のせいか Alt キーを押下しっぱなしのような挙動になるため一度 Alt キーを押下しておく
wShell.SendKeys("%")

' 終了する
Set wShell = Nothing
