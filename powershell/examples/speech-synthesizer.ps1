# ================================================================================
# Speech Synthesizer �Œ��点�� : ���؂�������ł� SAPI �Ɠ����{�C�X
# ================================================================================

Add-Type -AssemblyName System.speech;
$speech = New-Object System.Speech.Synthesis.SpeechSynthesizer;
$speech.Speak("�ǂ��� Neo �ł��B�����l�ł��BSpeech Synthesizer �ł��B");
