' 「游ゴシック Regular」「游ゴシック Light」のフォントを「游ゴシック Medium」のフォントファイルに差し替えて
' Windows 環境の游ゴシックを太めにするスクリプト
' 
' - 「游ゴシック Medium」のフォントファイルをコピーして用意してレジストリを書き換えます
' - 実行後、一度サインアウトして再度サインインすると変更が反映されます
' - 管理者権限がないと WScript.Shell の regWrite 関数で「レジストリ キー "…" のルートが無効です。」エラーが出るので
'   管理者権限で開いたコマンドプロンプトより `cscript ForceYuGothicMedium.vbs` と実行してください

' Object の用意
Dim shell : Set shell = WScript.CreateObject("WScript.Shell")
Dim fs    : Set fs    = WScript.CreateObject("Scripting.FileSystemObject")

' レジストリキーの宣言
Dim fontsKey           : fontsKey           = "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts\"
Dim yuGothicRegularKey : yuGothicRegularKey = fontsKey & "Yu Gothic Regular & Yu Gothic UI Semilight (TrueType)"
Dim yuGothicLightKey   : yuGothicLightKey   = fontsKey & "Yu Gothic Light & Yu Gothic UI Light (TrueType)"

' 変更前のレジストリ値を読んでおく
Dim yuGothicRegularValue : yuGothicRegularValue = shell.RegRead(yuGothicRegularKey)
Dim yuGothicLightValue   : yuGothicLightValue   = shell.RegRead(yuGothicLightKey)

WScript.Echo("変更前の YuGothic Regular フォントファイル名 : " & yuGothicRegularValue)
WScript.Echo("変更前の YuGothic Light フォントファイル名   : " & yuGothicLightValue)

' YuGothic Medium フォント
Dim fontsPath          : fontsPath      = "C:\Windows\Fonts\"
Dim yuGothicMediumFile : yuGothicMedium = "YuGothM.ttc"
' 以下のファイル名でコピーを配置する
Dim yuGothicMediumForRegular : yuGothicMediumForRegular = "YuGothM2.ttc"
Dim yuGothicMediumForLight   : yuGothicMediumForLight   = "YuGothM3.ttc"

' ファイルコピー実行
On Error Resume Next
Call fs.CopyFile(fontsPath & yuGothicMediumFile, fontsPath & yuGothicMediumForRegular)
Call fs.CopyFile(fontsPath & yuGothicMediumFile, fontsPath & yuGothicMediumForLight)
On Error GoTo 0
WScript.Echo(yuGothicMediumForRegular & " ファイルのコピー生成完了")
WScript.Echo(yuGothicMediumForLight   & " ファイルのコピー生成完了")

' レジストリ値を変更する
shell.RegWrite yuGothicRegularKey, yuGothicMediumForRegular, "REG_SZ"
shell.RegWrite yuGothicLightKey  , yuGothicMediumForLight  , "REG_SZ"
WScript.Echo("ファイルコピー・レジストリ変更完了")
