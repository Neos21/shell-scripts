@Echo Off

Rem Touch �R�}���h���ǂ�
Rem 
Rem Usage : touch [�t�@�C���p�X]
Rem �E�w��̃t�@�C�����Ȃ���΋�t�@�C����V�K�쐬����
Rem �E�w��̃t�@�C��������΍X�V�������X�V����



Rem �������Ȃ���Ή������Ȃ�
If %1. ==. Goto :EOF

If Not Exist %1 (
  Rem �t�@�C�����Ȃ���΍��
  Type Nul > %1
) Else (
  Rem �t�@�C��������Γ��t���X�V����
  Copy /b %1 +,, > Nul
)

Exit /b



Rem �E���C�� Windows �ɂ� touch �R�}���h������Ă����ŁI���@�I���@�I���@�I : http://gabekore.org/windows-touch-command
