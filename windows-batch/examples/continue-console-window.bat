@Echo Off

Rem �o�b�`�t�@�C���̏I���Ƌ��ɃR���\�[��������ꍇ�Ɍ����ăR���\�[�����J��������悤�ɂ���
Rem 
Rem �ECmd /k �ŃR���\�[�����g���������邪�A�o�b�`���R���\�[������Ăяo�����Ƃ��̓T�u�R���\�[�����J���Ă��܂�
Rem �E�o�b�`�t�@�C���܂ł̃t���p�X�����߂���Ɛ���ɓ��삵�Ȃ�



Echo ���炩�̏����c
Echo �o�b�`�t�@�C�����I�����܂��B
Pause



Rem �o�b�`�t�@�C���̏I���Ƌ��ɃR���\�[��������ꍇ�Ɍ����ăR���\�[�����J��������悤�ɂ���
Setlocal
Set _=%0
Echo %CMDCMDLINE% | Findstr /ir "Cmd.*/c.*%_:\=\\%" > Nul
Endlocal
If Not ERRORLEVEL 1 Cmd /k
Exit /b



Rem �EWindows Script Programming - �o�b�`�t�@�C�����s��ɃR���\�[�����g�� : http://scripting.cocolog-nifty.com/blog/2006/11/post_b6b4.html
