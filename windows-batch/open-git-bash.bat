@Echo Off

Rem GitBash ���N������o�b�`�t�@�C��
Rem 
Rem ���̃o�b�`�t�@�C���� PATH ��ʂ����t�H���_�Ɋi�[���Ă����΁A
Rem �G�N�X�v���[���̃A�h���X�o�[��u�t�@�C�������w�肵�Ď��s�v����
Rem �ubash�v�Ɠ��͂��邱�Ƃ� GitBash ���N���ł���
Rem 
Rem �E�����p�X�� system32 �ɂȂ�ꍇ�� %HOMEPATH% �ɂ���



If "%CD%" == "C:\WINDOWS\system32" (
  Cd %HOMEDRIVE%%HOMEPATH%
)

Start "" "C:\Program Files\Git\git-bash.exe"

Exit /b



Rem �EWindows �G�N�X�v���[������Git-Bash�̃R�}���h�E�C���h�E���J�� : http://qiita.com/ysks/items/9dba7bda6378c34939d7
