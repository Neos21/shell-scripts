@Echo Off

Rem list.exe �̎��s�w���p�[
Rem 
Rem Windows Server 2003 Resource Kit Tools �ɓ�������Ă���
Rem list.exe �̐ݒ�t�@�C���𐶐����A���s���܂��B
Rem 
Rem �Ehttps://www.microsoft.com/en-us/download/details.aspx?id=17657
Rem 
Rem list.exe �Ɠ����t�H���_�ɂ��̃o�b�`�t�@�C����u���A
Rem �J�������t�@�C�������̃o�b�`�t�@�C���Ƀh���b�O�E�A���h�E�h���b�v���Ă��������B



Rem ���̃o�b�`�t�@�C��������t�H���_���J�����g�t�H���_�ɂ��� (UNC �p�X��ł� OK)
Pushd %0\..

Rem list.exe ���Ȃ������璆�f
If Not Exist list.exe (
  Echo list.exe not found.
  Pause
  Exit /b
)

Rem ����1 (�h���b�O�E�A���h�E�h���b�v�����t�@�C��) ���Ȃ���Β��f
If '%1' == '' (
  list.exe /?
  Pause
  Exit /b
)

Rem ���ݒ���s�� tools.ini ���Ȃ���ΐ�������
If Not Exist tools.ini (
  (
    Echo [list]
    Echo tab 2
    Echo tcolor 1B
    Echo lcolor 0A
    Echo hcolor 1E
    Echo bcolor 3B
    Echo ccolor 1A
    Echo kcolor 0A
  ) > tools.ini
)

Rem tools.ini ��ǂݍ��܂��邽�߂̊��ϐ���ݒ肷��
Set INIT=%~dp0

Rem list.exe �����s����
list.exe %1

Pause
Exit /b



Rem �Q�l
Rem �Ehttps://support.microsoft.com/ja-jp/kb/206848
Rem     List.exe �c�[���͒P���ȃe�L�X�g�\�� / �����c�[���ŁA�t�@�C���̓��e��\�����܂��B
Rem �Ehttps://groups.google.com/forum/m/#!topic/microsoft.public.win32.programmer.tools/IkzI5PxkphE
