Option Explicit

' �}�E�X�̍��E�E�N���b�N�����ւ���
' 
' �R���g���[���p�l�� �� �}�E�X �� �u�}�E�X�̃v���p�e�B�v�E�B���h�E���J��
' �u��ƕ��{�^����؂�ւ���v�̃`�F�b�N�{�b�N�X���������u�K�p�v�{�^���������ăE�B���h�E�����

Dim wShell : Set wShell = WScript.CreateObject("WScript.Shell")

' �u�}�E�X�̃v���p�e�B�v�E�B���h�E���J��
wShell.Run("control mouse")
WScript.Sleep(500)

' �u�}�E�X�̃v���p�e�B�v�E�B���h�E���A�N�e�B�u�ɂ���
wShell.AppActivate("�}�E�X�̃v���p�e�B")
WScript.Sleep(500)

' �u��ƕ��{�^����؂�ւ���v�̃`�F�b�N�{�b�N�X���V���[�g�J�b�g�L�[ `Alt + S` �ŉ�������
wShell.SendKeys("%s")
WScript.Sleep(500)

' �u�K�p�v�{�^�����V���[�g�J�b�g�L�[ `Alt + A` �ŉ�������
wShell.SendKeys("%a")
WScript.Sleep(500)

' `Alt + F4` �Łu�}�E�X�̃v���p�e�B�v�E�B���h�E�����
wShell.SendKeys("%{F4}")
WScript.Sleep(500)

' Alt-IME-AHK �̂����� Alt �L�[�����������ςȂ��̂悤�ȋ����ɂȂ邽�߈�x Alt �L�[���������Ă���
wShell.SendKeys("%")

' �I������
Set wShell = Nothing
