@ECHO OFF
ECHO *** AkelPad resource replacer ***
ECHO Please close all AkelPad instances launched from %1%
PAUSE

SET AkelDir=%~1%
SET ScriptDir=%~dp0%
FOR /F %%F IN ("%ScriptDir%\*.res") DO (
	ECHO Replacing %%~nF...
	CALL "%ScriptDir%\ResHacker\ResHacker.exe" -modify "%AkelDir%\AkelPad.exe", "%AkelDir%\AkelPad.exe", "%%F" , , ,
)


SET /p Launch=Replace done. Launch AkelPad now? ["y" - launch, Enter - finish]: 
echo %Launch%
IF "%Launch%"=="y" START %AkelDir%\AkelPad.exe