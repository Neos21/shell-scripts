Option Explicit

' GitBash (Git SDK) �̃E�B���h�E���J���A�ʓr�p�ӂ��Ă��� Bash �X�N���v�g�����s����
' �G�N�X�v���[����ł��� VBS ���N���b�N����� GitBash �o�R�� Bash �X�N���v�g�����s�ł���V���[�g�J�b�g�ɂȂ�

WScript.CreateObject("WScript.Shell").Run "C:\git-sdk-64\usr\bin\mintty.exe --icon C:\git-sdk-64\git-bash.exe --exec '/usr/bin/bash' --login -i -c '/c/PATH/TO/BASH-SCRIPT-FILE'"
