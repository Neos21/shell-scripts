@Echo Off

Rem Windows �o�b�`�̒��� WSH �̃R�[�h�����݂�������@
Rem 
Rem WSH �̃X�N���v�g�t�@�C�������̏�Ő������Ď��s�A�g���I�������t�@�C�����폜���Ă���B
Rem Setlocal �� Endlocal �̊Ԃ̃t�@�C�������������~�\�B
Rem 
Rem �EFind �� Findstr �͍ŏI�s�����߂��Ȃ��o�O������A���̃o�b�`�t�@�C���̍ŏI�s����s�łȂ��Ə������������Ȃ��Ȃ��Ă��܂��B
Rem   �����ŁAType ���g���ăo�b�`�t�@�C�����g���p�C�v�œn���� Findstr ����悤�ɂ��Ă���B
Rem   �������āA�o�b�`�t�@�C�����g�̒�����A�s�����uVBS:�v��uJS:�v�Ŏn�܂�s��Ԃ��AFor ���Ɏg���Ă���B
Rem �E�udelims=:�v�ɂ���āA�uVBS: [�R�[�h]�v��uJS: [�R�[�h]�v�̃R���������ŋ�؂��B
Rem �E�utokens=1*�v�ƃA�X�^���X�N���g���ƁA�w�肵�Ă����Ō�̃g�[�N�� = 1 = %%a ����͂��ꂽ��ŁA
Rem   �s�Ɋ܂܂��c��̃e�L�X�g�����̎��̃g�[�N�� = %%b �ɑS�Đݒ肳���B
Rem   %%b �̒��� delims �Ɠ��������񂪊܂܂�Ă��Ă��A����͕�������Ȃ��B
Rem   ����ɂ��A%%a ���s���́uVBS�v��uJS�v�Ƃ�����������擾���Adelims �ɂ���āu:�v�����������B
Rem   %%b �ɂ͎c��̃e�L�X�g�A�܂�R�[�h���ݒ肳���B
Rem �E���̂܂܂��� %%b �̐擪�ɂ́uVBS: �v��uJS: �v�̖����̔��p�X�y�[�X���܂܂�Ă��܂��Ă���B
Rem   �����ŁA�x���W�J���g���� %%b ����������x�����ϐ� !LINE! �ɓ���A!LINE:~1! �Ƃ��邱�Ƃ�1������ = ���p�X�y�[�X���������Ă���B
Rem �E�uEcho.�v�̃h�b�g�́A!LINE:~1! ����ɂȂ������ɋ�s�Ƃ��ďo�͂����邽�߂̂��́B
Rem   Echo �R�}���h�̒���́u.,:;(�v������̕������q���Ēu���Ă��������ĉ��߂����B
Rem �E�x���W�J�����Ȃ��悤�ɂ���ɂ́A�uVBS:[�R�[�h]�v�̂悤�ɔ��p�X�y�[�X�����Ȃ����[���ɂ��Ă����΁A������������鏈�����s�v�ɂȂ�B



Echo Windows �o�b�`�ɂ��O����



Rem VBScript �t�@�C���̐����Ǝ��s
Set VBS=TempVBScript.vbs

Setlocal EnableDelayedExpansion
(
  For /f "delims=:, tokens=1*" %%a In ('Type "%~f0" ^| Findstr "^VBS:"') Do (
    Set LINE=%%b
    Echo.!LINE:~1!
  )
) > "%VBS%"
Endlocal

Cscript //NoLogo "%VBS%"

Del /q /f "%VBS%" > Nul 2>&1



Rem JScript �t�@�C���̐����Ǝ��s
Set JS=TempJScript.vbs

Setlocal EnableDelayedExpansion
(
  For /f "delims=:, tokens=1*" %%a In ('Type "%~f0" ^| Findstr "^JS:"') Do (
    Set LINE=%%b
    Echo.!LINE:~1!
  )
) > "%JS%"
Endlocal

Cscript //NoLogo //E:JScript "%JS%"

Del /q /f "%JS%" > Nul 2>&1



Echo Windows �o�b�`�ɂ��㏈��

Pause
Exit /b



Rem �R�R���� VBScript
Rem 
Rem �e�s�AVBScript �̃R�[�h�̎�O�ɁuVBS: �v�Ə����Ă��� (��s�����p�X�y�[�X��t�^����)�B

VBS: Option Explicit
VBS: 
VBS: Sub test()
VBS:   WScript.Echo "VBScript �ɂ�鏈��"
VBS: End Sub
VBS: test()



Rem �R�R���� JScript
Rem 
Rem �e�s�AJScript �̃R�[�h�̎�O�ɁuJS: �v�Ə����Ă��� (��s�����p�X�y�[�X��t�^����)�B

JS: var test = function() {
JS:   WScript.Echo("JScript �ɂ�鏈��");
JS: }
JS: 
JS: test();



Rem �EPositioning CMD Window : http://www.dostips.com/forum/viewtopic.php?t=4285
