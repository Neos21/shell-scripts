@Echo Off

Rem ���[�U�ɃL�[���͂ŏ������w�肵�Ă��炤�T���v��
Rem 
Rem �E������Ɩʓ|�ȏ������ȒP�ȃL�[���͂ŌĂяo����V���[�g�J�b�g�Ƃ���
Rem �E���������s���邩�ǂ������[�U�Ɋm�F���Ƃ�X�N���v�g�Ƃ���



Rem ���̃o�b�`�t�@�C��������t�H���_���J�����g�t�H���_�ɂ��� (UNC �p�X��ł� OK)
Pushd %0\..



:START
Cls
Echo ����������������������������������������
Echo �L�[���͂ŏ������w�肵�Ă��炤�o�b�`�t�@�C��
Echo.
Echo �ȉ��̂����ꂩ�̃L�[����͂��Ă��������B
Echo.
Echo   [exp] �G�N�X�v���[�����J��
Echo   [i]   IP Config �����s����
Echo   [q]   �I��
Echo ����������������������������������������



:USER_KEY_LOOP
Rem �L�[���͂��󂯕t����B�u^>�v�̓��_�C���N�g�L���u>�v���G�X�P�[�v���Ă���
Set USER_KEY=
Set /p USER_KEY=�R�}���h + Enter ^> 

Rem �L�[���͂�����Ă�����擪3�����݂̂ɂ���
If Not "%USER_KEY%" == "" Set USER_KEY=%USER_KEY:~0,3%

Rem �L�[���͂��w��̕�����ƈ�v������A���x���ŊY�������Ɉړ�����
If "%USER_KEY%" == "exp" Goto OPEN_EXPLORER

Rem �擪1�����݂̂ɂ���
If Not "%USER_KEY%" == "" Set USER_KEY=%USER_KEY:~0,1%

Rem �uexp�v�̕����Ɠ��l�ɏ�����������
If "%USER_KEY%" == "i" Goto EXEC_IPCONFIG
If "%USER_KEY%" == "q" Goto QUIT_THIS_BAT

Rem �����́E�������̓L�[���͂���v���Ȃ��ꍇ�̓��[�v����
Goto USER_KEY_LOOP



Rem �ȍ~�A�w�肵���L�[�ɉ��������������x���ŕ����ċL�q����



:OPEN_EXPLORER
Echo.
Echo �G�N�X�v���[�����N�����܂��B

Start Explorer

Rem �������ꎞ��~�� START ���x���Ɉړ�����
Echo.
Pause
Goto START



:EXEC_IPCONFIG
Echo.

Ipconfig

Echo.
Pause
Goto START



:QUIT_THIS_BAT
Echo.
Echo �o�b�`�t�@�C�����I�����܂��B
Echo.
Pause
Exit /b



Rem �E��Ɍ���ƃV�X�e���J���Ɋւ��� - �J���p�̃t�H���_�\���������I�ɐ������Ă����o�b�` (�v���W�F�N�g�p�̃��|�W�g�������グ�ɕ֗��B���łɗp���ς񂾂玩������)
Rem     http://language-and-engineering.hatenablog.jp/entry/20120126/p1
Rem �E��Ɍ���ƃV�X�e���J���Ɋւ��� - �J���ɖ𗧂� BAT �t�@�C���̏������E�p�^�[���W (�R�}���h�v�����v�g�̒�΂�̌n�I�Ɋw�уo�b�`�����҂ɂȂ낤)
Rem     http://language-and-engineering.hatenablog.jp/entry/20130502/PatternsOfMSDOSorBAT
