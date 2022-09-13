# ================================================================================
# Speech Synthesizer で喋らせる : 検証した限りでは SAPI と同じボイス
# ================================================================================

Add-Type -AssemblyName System.speech;
$speech = New-Object System.Speech.Synthesis.SpeechSynthesizer;
$speech.Speak("どうも Neo です。お疲れ様です。Speech Synthesizer です。");
