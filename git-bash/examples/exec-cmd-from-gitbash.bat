: <<EOF
@Echo Off
Goto WINDOWS
EOF
exec cmd //c ${0//\//\\\\} $*
:WINDOWS

@Rem GitBash ���璼�ڎ��s���Ă��R�}���h�v�����v�g������s���Ă��K�� Windows �o�b�`�t�@�C���Ƃ��Ď��s�����t�@�C�������
@Rem 
@Rem - GitBash ���炱�̃o�b�`�t�@�C���𒼐ڎ��s��������1�s�ڂ��� `EOF` �܂ł̍s���q�A�h�L�������g�Ƃ��Ė�������
@Rem   `exec cmd` �̍s�ɂ���� Windows �R�}���h�v�����v�g�Ŏ��g���J������
@Rem - `cmd.exe` �ł��̃o�b�`�t�@�C�������s��������1�s�ڂ����x�������ɂȂ� `Goto` �R�}���h���� `:WINDOWS` ���x���̍s�Ɉړ�����
@Rem   ����Ă���ȍ~�ɏ����ꂽ�s�� Windows �o�b�`�t�@�C���Ƃ��ĕK�����s�����

Echo Hello World
Pause

Exit /b
