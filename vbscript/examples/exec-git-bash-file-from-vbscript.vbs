Option Explicit

' ====================================================================================================
' この VBScript ファイルと同じ階層にある、同じファイル名の
' Bash スクリプトファイルを Git Bash (Git SDK) で実行する
' 
' - 本 VBScript ファイルは UTF-8・CRLF で記述する
' - 本ファイルを `C:\PATH\TO\my-script.vbs` に配置したら
'   GitBash スクリプトファイルは `C:\PATH\TO\my-script.bash` に配置する
' - 最初に実行する GitBash ファイルのフルパスを表示、
'   終了したら `read -p` コマンドで Finished と表示しているが不要ならよしなに
' - GitBash では実行権限なしでスクリプトファイルを実行できるため、例えば
'   Shebang `#!/usr/bin/env node` で実装した `.nodejs` ファイルなども実行可能である
' ====================================================================================================

WScript.CreateObject("WScript.Shell").Run "C:\git-sdk-64\usr\bin\mintty.exe --icon C:\git-sdk-64\git-bash.exe --exec '/usr/bin/bash' --login -i -c 'echo ""$(pwd)/" & Replace(WScript.ScriptName, ".vbs", ".bash") & """ ; ""$(pwd)/" & Replace(WScript.ScriptName, ".vbs", ".bash") & """ ; read -p ""Finished""'"

' スクリプトファイルの実行だけで良ければ以下
'WScript.CreateObject("WScript.Shell").Run "C:\git-sdk-64\usr\bin\mintty.exe --icon C:\git-sdk-64\git-bash.exe --exec '/usr/bin/bash' --login -i -c '""$(pwd)/" & Replace(WScript.ScriptName, ".vbs", ".bash") & """'"
