@echo off
set "source_folder=%~dp0"
set "destination_folder=%~dp0"
set "unzip_utility=C:\Program Files\WinZip\WZUNZIP.EXE"
set "password=s01012004"
set "total_commander=C:\totalcmd\TOTALCMD64.EXE"

echo Starter udpakning af alle .zipx-filer fra %source_folder% med 2 minutters interval...
echo.

:: T\Uffffffffer, hvor mange filer der er startet
set /a file_count=0

for %%f in ("%source_folder%*.zipx") do (
    set /a file_count+=1
    echo Udpakker fil %file_count%: "%%f"

    start "" "%unzip_utility%" -e -d -%password% "%%f" "%destination_folder%"
    echo DEBUG: Kalder: start "" "%unzip_utility%" -e -d -%password% "%%f" "%destination_folder%"

    echo Venter 300 sec
    ping localhost -n 301 > nul
)
