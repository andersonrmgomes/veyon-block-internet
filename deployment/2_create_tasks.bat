schtasks /Create /TN "BloquearInternet" /TR "C:\Scripts\ControleInternet.bat bloquear" /SC ONCE /ST 00:00 /RL HIGHEST /F
schtasks /Create /TN "LiberarInternet" /TR "C:\Scripts\ControleInternet.bat liberar" /SC ONCE /ST 00:00 /RL HIGHEST /F

