Rem ^
/*
@Echo Off
Cls



Rem Windows �o�b�`�̒��� SQL �������Ă��� SQL*Plus �Ŏ��s������@

Sqlplus USER/PASS@ORCL @"%~f0"



Pause
Exit /b
*/



-- �������� SQL*Plus �œǂݍ��� SQL

SELECT 1 FROM DUAL;



/*
 * # ���쌴��
 * 
 * Windows �o�b�`�Ƃ��ċN������ƁA1�`2�s�ڂ́uRem ^�v�ŉ��s���G�X�P�[�v���A�uRem /*�v�Ƃ��ď�������B
 * ���� Rem ���R���\�[���ɕ\������邽�߁A����� @Echo Off �� Cls ���s���Ă����B
 * �C�ӂ̏���������� Sqlplus �R�}���h�� DB �ڑ����A�u@�v�Ŏ������g�� SQL �X�N���v�g�Ƃ��Ď��s������B
 * 
 * SQL �t�@�C���Ƃ��ẮA1�s�ڂ� Rem �R�}���h�Ƃ��Ė����A2�s�ڂ���u���b�N�R�����g�Ƃ��Ė��������B
 * �u���b�N�R�����g�̏I���ȍ~�� SQL ���L�q���Ă����΁A���ꂪ���s�����B
 * 
 * SQL*Plus ���I������ƁAPause �� Exit /b �Ńo�b�`�t�@�C�����I������B
 * ���̍s�́u*/�v�͓ǂݍ��܂�Ȃ����ߖ��������B
 * 
 * # �ʂ̏�����
 * 
 * 1�s�ɏW�񂵂�
 * Rem /? > Nul & @Cls & @Sqlplus USER/PASS@ORCL @"%~0" & @Pause & @Goto :EOF
 * �Ə����Ă����l�ɓ��삷��B
 * 
 * 1�s�ɂ���ꍇ�AWindows �o�b�`�� Rem �ȍ~���R�}���h�Ƃ��ĉ��߂����邽�߂�
 * �uRem /?�v�Ńw���v��\�������ANul �Ƀ��_�C���N�g���Ă���B
 * ���Ƃ́u&�v�ŃR�}���h���q���ł��������B
 * �����2�s�ڈȍ~�� SQL ���L�q����Ηǂ��B
 */
