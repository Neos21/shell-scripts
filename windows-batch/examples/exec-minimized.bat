@Echo Off

Rem �E�B���h�E���ŏ���������ԂŋN������

If Not "%~0" == "%~dp0.\%~nx0" (
  Start /min Cmd /c, "%~dp0.\%~nx0" %*
  Goto :EOF
)



Rem ���̃o�b�`�t�@�C��������t�H���_���J�����g�t�H���_�ɂ��� (UNC �p�X��ł� OK)
Pushd %0\..

Echo ���炩�̏���

Pause
Exit /b



Rem �ETorutk - Windows �o�b�`�t�@�C�� : http://www.torutk.com/projects/swe/wiki/Windows%E3%83%90%E3%83%83%E3%83%81%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB
Rem �E�}�R�g�̂������ᔠ - Windows �o�b�`�t�@�C�� (.bat) ���ŏ���������ԂŋN������ : http://piyopiyocs.blog115.fc2.com/blog-entry-731.html
Rem �E�Ή�̓��� - �o�b�`�t�@�C�����ŏ������ċN�� : http://d.hatena.ne.jp/firedfly/20091124/p1
Rem     @If Not "%~0" == "%~dp0.\%~nx0" Start /min Cmd /c, "%~dp0.\%~nx0" %* & Goto :EOF
Rem �E�Ή�̓��� - �o�b�`�t�@�C���̌��E : http://d.hatena.ne.jp/firedfly/20091125
Rem     cmd /c, �ƃJ���}�������Ă���̂́A�t�@�C�����ɋ󔒂��܂ރt�@�C���� D&D �����Ƃ��p�ł��B
Rem     �J���}���Ȃ��ƃR�}���h���C������Ă񂾂Ƃ��͏�肭�����̂ɁAD&D �����Ƃ��������s���܂��B
Rem     �J���}�̑���ɃZ�~�R�����ł��悭�A���̓�͈����̋�؂�Ɏg���̂ŁA�Ȃɂ����甼�p�󔒂̏����Ɋւ���d�l�����肻���ł��B
