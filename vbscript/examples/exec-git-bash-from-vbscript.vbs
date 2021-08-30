Option Explicit

' ====================================================================================================
' この VBScript ファイル中の「行頭にアポストロフィが3つ連続している行」を
' Bash スクリプトとして解釈し Git Bash (Git SDK) で実行する
' 
' - 本 VBScript ファイルは UTF-8・CRLF で記述する
' - VBScript においてアポストロフィはコメントを示す記号なので、コレで Bash 部分をコメントアウトする
' - Bash 内で本ファイルを grep・sed して Bash 部分を抽出し eval で実行する
' - 改行の解釈を調整するため IFS を操作しているので、IFS を操作するスクリプトの動作は保証できない
' ====================================================================================================

' Git SDK 起動コマンドを組み立てる
Dim command
command = "C:\git-sdk-64\usr\bin\mintty.exe --icon C:\git-sdk-64\git-bash.exe --exec '/usr/bin/bash' --login -i -c """ & _
          "export IFS= ; eval $(grep '^'\'''\'''\''' '" & WScript.ScriptFullName & "' | sed 's/^'\'''\'''\''//') ; read" & _
          """"

' CScript で起動した場合のみデバッグ用として変数 command を出力する
If LCase(Right(WScript.FullName, 11)) = "cscript.exe" Then WScript.Echo command End If

' Git SDK を起動しスクリプトを実行する
WScript.CreateObject("WScript.Shell").Run command

' 以下・実行したい Bash スクリプトを記す (各行頭に「アポストロフィ3つ」を記す)



'''echo 'Start 開始'
'''pwd
'''my_example_var='example'
'''if [ "${my_example_var}" = 'example' ]; then
'''  echo 'Yes example!'
'''else
'''  echo 'Not example!'
'''fi
'''echo 'End 終了'
