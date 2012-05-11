::@ECHO OFF
ECHO *** AkelPad resource replacer ***

IF "%1%"=="" (
	ECHO Parameter - path to AkelPad.exe - required
	PAUSE
	EXIT /B
)

ECHO Please close all AkelPad instances launched from %1%
PAUSE

SET AkelDir=%~1%
SET CurDir=%~dp0%
FOR /F %%F IN ("%CurDir%*.res") DO (
	ECHO Replacing %%~nF...
	CALL "%CurDir%ResHacker\ResHacker.exe" -modify "%AkelDir%\AkelPad.exe", "%AkelDir%\AkelPad.exe", "%%~dpnxF", , ,
)


SET /p Launch=Replace done. Launch AkelPad now? ["y" - launch, Enter - finish]: 
echo %Launch%
IF "%Launch%"=="y" START %AkelDir%\AkelPad.exe