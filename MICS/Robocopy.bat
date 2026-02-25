@echo off
SETLOCAL

:: Parametre fra kommandolinjen
SET "source=%~1"
SET "destination=%~2"
SET "logpath=%~3"

:: Tjek om parametre er udfyldt
IF "%~1"=="" GOTO Usage
IF "%~2"=="" GOTO Usage
IF "%~3"=="" GOTO Usage

:: Kørsel af Robocopy
:: /LOG+ bruges for at tilføje til eksisterende log.
robocopy "%source%" "%destination%" *.7z /S /ETA /R:3 /W:5 /MT:16 /TEE /LOG+:"%logpath%"

:: Åbn logfilen i Notepad efter kørsel
IF EXIST "%logpath%" start notepad.exe "%logpath%"

GOTO End

:Usage
echo.
echo Mangler parametre!
echo Brug: copy_7z.bat "Kilde" "Destination" "Logfil_Sti"
echo Eksempel: copy_7z.bat "N:" "D:" "D:\robocopy_7z.log"
echo.
pause

:End
ENDLOCAL
