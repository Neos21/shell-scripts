@Echo Off

Rem �R�}���h�v�����v�g�͐�������Ă��邪�A�o�b�`�t�@�C���Ȃ瓮�삷����ŁA
Rem �o�b�`�t�@�C���ŃR�}���h�v�����v�g���Č�����B
Rem 
Rem �u�R�}���h�v�����v�g�͊Ǘ��҂ɂ���Ďg�p�s�ɂ���Ă��܂��v�Ƃ��������́A�ȉ��̃��W�X�g���Ő�������Ă���B
Rem User Key   : [HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System]
Rem Value Name : DisableCMD
Rem Data Type  : REG_DWORD (DWORD Value)
Rem Value Data : 0 = default, 1 = disabled, 2 = disabled but allow batch



Rem ���̃o�b�`�t�@�C��������t�H���_���J�����g�t�H���_�ɂ��� (UNC �p�X��ł� OK)
Pushd %0\..

Rem Exit ����܂Ŗ������[�v
:LOOP

Rem �v�����v�g�����
Set /p CMD_EVAL=%CD%^>

Rem �����͂Ȃ珈�����Ȃ�
If "%CMD_EVAL%" == "" Goto :LOOP

Rem �󂯎��������������̂܂܃R�}���h�Ƃ��Ď��s����
%CMD_EVAL%

Rem ��s�J���ē��͒l������������
Echo.
Set CMD_EVAL=

Goto :LOOP



Rem �Q�l
Rem �Ehttp://www.pctools.com/guides/registry/detail/1143/
Rem �Ehttp://pasofaq.jp/windows/command/disablecmd.htm
