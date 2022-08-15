Option Explicit

' GitBash (Git SDK) のウィンドウを開き、別途用意してある Bash スクリプトを実行する
' エクスプローラ上でこの VBS をクリックすれば GitBash 経由で Bash スクリプトが実行できるショートカットになる

WScript.CreateObject("WScript.Shell").Run "C:\git-sdk-64\usr\bin\mintty.exe --icon C:\git-sdk-64\git-bash.exe --exec '/usr/bin/bash' --login -i -c '/c/PATH/TO/BASH-SCRIPT-FILE'"
