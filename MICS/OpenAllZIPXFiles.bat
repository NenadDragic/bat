@echo off
set "source_folder=N:\Temp - No Backup"
set "destination_folder=N:\Temp - No Backup"
set "unzip_utility=C:\Program Files\WinZip\WZUNZIP.EXE"
set "password=s"
set "total_commander=C:\totalcmd\TOTALCMD64.EXE"

echo Starter udpakning af alle .zipx-filer fra %source_folder% med 2 minutters interval...
echo.

:: Tæller, hvor mange filer der er startet
set /a file_count=0

for %%f in ("%source_folder%\*.zipx") do (
    set /a file_count+=1
    echo Udpakker fil %file_count%: "%%f"

    :: Fjernet /wait for at starte processen i baggrunden
    start "" "%unzip_utility%" -e -d -%password% "%%f" "%destination_folder%"
    echo DEBUG: Kalder: start "" "%unzip_utility%" -e -d -%password% "%%f" "%destination_folder%"

    echo Venter 300 sec
    :: PING bruges til at vente. -n 301 giver en ventetid p\Uffffffff (ca. 301 sekunder)
    ping localhost -n 301 > nul
)

echo.
echo Udpakning fuldført Total Commander...
start "" "%total_commander%" "V:\" "%destination_folder%"

echo Finish!
pause
