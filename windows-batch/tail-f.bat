@Echo Off

Rem Tail -f �R�}���h���ǂ�
Rem 
Rem ���̓t�@�C�����o�̓I�[�v������Ă���Ԃ͊Ď����p������B
Rem ���̓t�@�C���ւ̏o�̓I�[�v�����N���[�Y�����ƏI������B



Setlocal

If Not Exist "%~1" (
  Echo Usage: %~nx0 [File Name]
  Goto :EOF
)

Set SS=0
Set LL=0

:TOP

If %SS%==%~z1 (
  Ping localhost -n 2 > Nul
  Rem �ǋL�ł��邩�m�F���ăG���[�ɂȂ�Ȃ�������I��
  Cmd /c "Type Nul >> %1" 2>Nul
  If Not ERRORLEVEL 1 Goto :EOF
  Goto :TOP
)

Set SS=%~z1

For /f "delims=[] tokens=1*" %%1 In ('Find /n /v "" ^<%1 ^|More +%%LL%%') Do (
  Set LL=%%1
  Echo:%%2
)

Goto :TOP



Rem �u�o�̓I�[�v������Ă��邩�v�́ANul ���ǋL�ł��邩�������Ċm�F���Ă���B
Rem �������� Notepad++ �ł̓t�@�C�����J���Ă��鎞���t�@�C�������b�N���Ă��Ȃ����ߍČ��ł��Ȃ����A
Rem �T�N���G�f�B�^�̓t�@�C�������b�N����̂ŁA������Č��ł���B
Rem �E�o�b�`�t�@�C���ō�� tail -f �R�}���h : http://scripting.cocolog-nifty.com/blog/2007/05/tail_f_0b9c.html
