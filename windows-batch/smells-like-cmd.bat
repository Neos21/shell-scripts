@Echo Off

Rem コマンドプロンプトは制限されているが、バッチファイルなら動作する環境で、
Rem バッチファイルでコマンドプロンプトを再現する。
Rem 
Rem 「コマンドプロンプトは管理者によって使用不可にされています」という制限は、以下のレジストリで制限されている。
Rem User Key   : [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System]
Rem Value Name : DisableCMD
Rem Data Type  : REG_DWORD (DWORD Value)
Rem Value Data : 0 = default, 1 = disabled, 2 = disabled but allow batch



Rem このバッチファイルがあるフォルダをカレントフォルダにする (UNC パス上でも OK)
Pushd %0\..

Rem Exit するまで無限ループ
:LOOP

Rem プロンプトを作る
Set /p CMD_EVAL=%CD%^>

Rem 未入力なら処理しない
If "%CMD_EVAL%" == "" Goto :LOOP

Rem 受け取った文字列をそのままコマンドとして実行する
%CMD_EVAL%

Rem 空行開けて入力値を初期化する
Echo.
Set CMD_EVAL=

Goto :LOOP



Rem 参考
Rem ・http://www.pctools.com/guides/registry/detail/1143/
Rem ・http://pasofaq.jp/windows/command/disablecmd.htm