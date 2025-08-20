@echo off
set "source_folder=D:\Org\Infrequent"
set "destination_folder=D:\Org\Infrequent\"
set "unzip_utility=C:\Program Files\WinZip\WZUNZIP.EXE"
set "password="
set "total_commander=C:\totalcmd\TOTALCMD64.EXE"

echo Starter udpakning af alle .zipx-filer fra %source_folder%...
echo.

for %%f in ("%source_folder%\*.zipx") do (
    echo Udpakker fil: "%%f"
    start /wait "" "%unzip_utility%" -e -d -%password% "%%f" "%destination_folder%"
    echo Vent 2 minutter...
    ping localhost -n 121 > nul
)

echo.
echo Udpakning fuldført. Starter Total Commander...
start "" "%total_commander%" "V:\" "%destination_folder%"

echo Færdig!
pause