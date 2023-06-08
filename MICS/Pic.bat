@echo off

REM Create the folders
md ORG
md MOV
md MP4
md CR2

REM Copy the files to the corresponding folders
move /Y *.mov MOV
move /Y *.mp4 MP4
move /Y *.CR2 CR2
copy /Y *.jpg ORG
copy /Y *.jpeg ORG

REM Delete empty directories (It will check and delete empty directories in the current directory)
for /d %%D in (*) do (
    dir /b "%%D"|findstr "^">nul || rmdir /s/q "%%D"
)

echo All tasks completed.
