@Echo Off

Rem Wait (Sleep) ��������������T���v��
Rem 
Rem �ȉ��̃T���v���͂������ 3 �b��~����



Echo.
Echo Ping �R�}���h�� Wait ���� (��ԐF�X�Ȋ��Ŏg���邩�E�u�w��̕b�� + 1�v�������ɗ^����)
Ping localhost -n 4 > Nul

Echo.
Echo Choice �R�}���h�� Wait ���� (�L�[���͂ɂ�蓮�삪���f���邩��)
Choice /c yn /d y /t 3 > Nul

Echo.
Echo Timeout �R�}���h�� Wait ���� (Windows Vista �ȍ~�̕W���R�}���h�E�L�[���͂ŏI������)
Timeout 3 > Nul

Echo.
Echo Sleep �R�}���h�� Wait ���� (Windows Server 2003 Resource Kit Tools �Ɋ܂܂��R�}���h)
Sleep 3

Pause
Exit /b



Rem �EWindows �̃R�}���h�v�����v�g�� sleep ����3�̕��@ : https://www.xmisao.com/2013/11/19/how-to-sleep-in-windows-command-prompt.html
Rem     �E���[�J���z�X�g�� ping ���Ď��s�񐔂ɂ���~���Ԃ𐧌䂷����@�B
Rem       127.0.0.1 ���K���������A���� ping �̑��M�Ԋu��1�b�ł��邱�Ƃ����p�������́B
Rem     �Echoice �̓��[�U�ɑI����������R�}���h�ł���B���̃R�}���h�̓��[�U�ɑI������񎦂��A��莞�ԓ��͂��Ȃ���΁A�f�t�H���g���I�����ꂽ���̂Ƃ݂Ȃ��B
Rem       choice �� /t �X�C�b�`�Ń^�C���A�E�g��ݒ�ł���B
Rem �EWindows �� timeout / sleep �R�}���h�Ŏ��s���ꎞ��~���� : http://www.atmarkit.co.jp/ait/articles/1206/08/news137.html
Rem     �EWindows Vista / Windows Server 2003 �ȍ~�� Windows OS �ɂ́Atimeout.exe �Ƃ����R�}���h���p�ӂ���Ă���B
Rem       ���X�� Windows 2000 �� Resource Kit �Ɋ܂܂�Ă����c�[���B
Rem       �P�Ɏw�肳�ꂽ���Ԃ�҂����łȂ��A�r���ŉ��炩�̃L�[���͂�����ƁA�����ŏI������ (�x�~�𒆒f����)�B
Rem       sleep �R�}���h�Ƃ������́A�ő�҂����Ԑ����t���� pause �R�}���h�Ƃ��������̃R�}���h�ł���B
Rem     �E��ԐV���� sleep.exe �� Windows Server 2003 Resource Kit Tools �Ɋ܂܂�Ă���B
Rem �E Windows Server 2003 Resource Kit Tools : https://www.microsoft.com/en-us/download/details.aspx?id=17657
