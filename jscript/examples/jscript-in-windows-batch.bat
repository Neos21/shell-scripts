@if(0)==(0) Echo Off

Rem Windows �o�b�`�̒��� JScript �̃R�[�h�����݂�������@



Echo Windows �o�b�`�ɂ��O����

Rem JScript �̌Ăяo��
Cscript //NoLogo //E:JScript "%~f0" %*

Echo Windows �o�b�`�ɂ��㏈��

Pause
Exit /b

@end

// �R�R���� JScript

WScript.echo("WSH JScript �ɂ�鏈��");



/*
 * # ���쌴��
 * 
 * - Windows �o�b�`�t�@�C���Ƃ��ĕۑ�����̂ŁA�܂��� Windows �o�b�`�Ƃ���1�s�ڂ��]�������B
 *   @ �ŃR���\�[���o�͂͂��ꂸ�A0 == 0 �͓��R true �Ȃ̂� Echo Off �ƂȂ�B
 * - �������� @end �Ƃ����s�̒��O�܂ł� Windows �o�b�`�Ƃ��ē��삷��B
 *   Exit /b �Ȃ� Goto :EOF �Ȃ�ŁA�o�b�`�t�@�C���͏I��������΁A����ȍ~�̍s�͓ǂݍ��܂�Ȃ��B
 * - �r���� CScript �Ŏ������g�� JScript �Ƃ��Ď��s�����Ă���B
 * 
 * - JScript �Ƃ��Ă��̃t�@�C����1�s�ڂ���]�����Ă����ƁA@if ���� @end �܂ł�
 *   �u@if�E@elif�E@else�E@end �X�e�[�g�����g�v�Ƃ��� JScript �Ǝ��̍\���Ƃ��ĉ��߂����B
 * - 1�s�ڂ� @if(0)==(0) �� @if �X�e�[�g�����g�� if(0) �Ƃ݂Ȃ����B
 *   0 �� false �����Ȃ̂ŁA�����Ɉ�v�����A@end �܂ł̒��g�͕]���E���s����Ȃ��Ȃ�B
 * 
 * # �Q�l
 * 
 * - JScript �Ńn�}����X : http://d.hatena.ne.jp/miya2000/20090823/p0
 * - BAT �� WSH �̃R�[�h��1�t�@�C���ɍ��݂����邽�߂� shebang �L�@ : http://computer-technology.hateblo.jp/entry/20131025/p1
 * - @if...@elif...@else...@end �X�e�[�g�����g : https://msdn.microsoft.com/ja-jp/library/ct27x3xa.aspx
 * - MS-DOS �̃o�b�`�t�@�C���ɁAWSH (JScript) �̃R�[�h���L�q���� : http://www.odin.hyork.net/write/write0028.html
 *     ������� @if(1==1) �� JScript �ɂ� true ���肳���邪�A���ォ��u���b�N�R�����g�Ƃ��Ĉ͂ޏ������B
 */
