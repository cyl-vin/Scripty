@echo off
setlocal enabledelayedexpansion

::Define color codes
:: Dark Red foreground
set "cdr=[31m"
:: Dark Green foreground
set "cdg=[32m"
:: Dark Yellow foreground
set "cdy=[33m"
:: Dark Blue foreground
set "cdb=[34m"
:: Dark Magenta foreground
set "cdm=[35m"
:: Dark Cyan foreground
set "cdc=[36m"
:: Dark White foreground
set "cdw=[37m"
:: Bright Black foreground
set "cbb=[90m"
:: Bright Red foreground
set "cbr=[91m"
:: Bright Green foreground
set "cbg=[92m"
:: Bright Yellow foreground
set "cby=[93m"
:: Bright Blue foreground
set "fbb=[94m"
:: Bright Magenta foreground
set "cbm=[95m"
:: Bright Cyan foreground
set "cbc=[96m"
:: White foreground
set "cw=[97m"
:: Background Black
set "bb=[40m"
:: Background Dark Red
set "bdr=[41m"
:: Background Dark Green
set "bdg=[42m"
:: Background Dark Yellow
set "bdy=[43m"
:: Background Dark Blue
set "bdb=[44m"
:: Background dark Magenta
set "bdm=[45m"
:: Background Dark Cyan
set "bdc=[46m"
:: Background Dark White
set "bdw=[47m"
:: Background Light Black
set "blb=[100m"
:: Background Bright Red
set "bbr=[101m"
:: Background Bright Green
set "bbg=[102m"
:: Background Bright Yellow
set "bby=[103m"
:: Background Bright Blue
set "bbb=[104m"
:: Background Bright Magenta
set "bbm=[105m"
:: Background Bright Cyan
set "bbc=[106m"
:: Background Background White
set "bw=[107m"
:: Bold
set "bold=[1m"
:: Underline
set "u=[4m"
:: No Underline
set "nu=[24m"
:: Reverse Text
set "rt=[7m"
:: Positive Text (Not reversed)
set "pt=[27m"
:: Color Reset
set "cr=[0m"

:main
title Cylvin's Collection Of Batch Programs
cls
echo %cdc%----------------------------------------------------------------%cr%
echo Type the number of the option you want to choose and press %cdg%ENTER%cr%
echo %cdc%----------------------------------------------------------------%cr%
echo %cdy%1.)%cr% Check internet status
echo %cdy%2.)%cr% Organize some files in this directory
echo %cdy%3.)%cr% Change file extensions in this directory
echo %cdy%4.)%cr% Terminal color test
echo %cdy%0.)%cr% %cdr%EXIT%cr%
echo %cdc%----------------------------------------------------------------%cr%
echo Type %cdr%Exit%cr% to close this program from anywhere
echo Type Leave anywhere to come back to this menu
echo %cdc%----------------------------------------------------------------%cr%
set /p input=%cdr%%bdw%Main Menu%cr%:-$

if "%input%"=="0" exit
if "%input%"=="1" goto pingcheck
if "%input%"=="2" goto organize
if "%input%"=="3" goto choice
if "%input%"=="4" goto colors
if "%input%"=="exit" exit
goto main

:pingcheck
title Checking Connectivity
cls
echo %cdc%----------------------------------------------------------------%cr%
echo Type a website URL or IP Address
echo below to check if you are connected to
echo the internet or that device IP
echo %cdc%----------------------------------------------------------------%cr%
echo Type %cdc%leave%cr% to go to the main menu
echo %cdc%----------------------------------------------------------------%cr%
set /p "data=%cdg%Website/IP%cr%:-$ "

if "%data%"=="exit" exit
if "%data%"=="leave" goto main

ping !data!
pause
goto pingcheck

:organize
cls

echo %cdc%----------------------------------------------------------------%cr%
echo How would You like to Organize the files in this directory?
echo %cdc%----------------------------------------------------------------%cr%
echo Type %cdy%X%cr% to organize all files by extension into sperate folders
echo Type %cdy%video%cr% to organize video files into a folder called "Videos"
echo Type %cdy%image%cr% to organize image files into a folder called "Images"
echo Type %cdc%Leave%cr% and hit %cdg%ENTER%cr% to go to the Main Menu
echo Type %cdr%Exit%cr% and hit %cdg%ENTER%cr% to exit this program
echo %cdc%----------------------------------------------------------------%cr%
set /p "input=Batch:-$ "

if "%input%"=="x" goto extension
if "%input%"=="video" goto video
if "%input%"=="image" goto image
if "%input%"=="exit" exit
if "%input%"=="leave" goto main
goto organize

:video
cls
:: Get the current directory where the batch script is located
set "rootdir=%~dp0"

:: Create "Videos" folder if it doesn't exist
if not exist "!rootdir!\Videos" (
    mkdir "!rootdir!\Videos"
)

:: Move video files (might add more extensions)
for %%F in ("%rootdir%\*.mp4" "%rootdir%\*.mkv" "%rootdir%\*.avi" "%rootdir%\*.mov" "%rootdir%\*.webm") do (
    move "%%F" "!rootdir!\Videos"
)

echo Video files have been moved to the 'Videos' folder.
pause
goto organize

:image
cls
:: Get the current directory where the batch script is located
set "rootdir=%~dp0"

:: Create "Images" folder if it doesn't exist
if not exist "!rootdir!\Images" (
    mkdir "!rootdir!\Images"
)

:: Move picture files (might add more extensions)
for %%F in ("%rootdir%\*.jpg" "%rootdir%\*.png" "%rootdir%\*.bmp" "%rootdir%\*.gif" "%rootdir%\*.ico" "%rootdir%\*.jpeg" "%rootdir%\*.tif" "%rootdir%\*.tiff" "%rootdir%\*.psd" "%rootdir%\*.svg" ) do (
    move "%%F" "!rootdir!\Images"
)

echo Image files have been moved to the 'Images' folder.
pause
goto organize

:extension
cls
:: Get the current directory where the batch script is located
set "rootdir=%~dp0"

:: Create folders for each unique file extension
for %%F in ("%rootdir%\*.*") do (
    set "file=%%~nxF"
    set "ext=%%~xF"
    
    :: Skip batch files (modify this condition as needed)
    if /i "!ext!" NEQ ".bat" (
        if not exist "!rootdir!\!ext!" (
            mkdir "!rootdir!\!ext!"
        )
        move "%%F" "!rootdir!\!ext!"
    )
)

echo All files (except batch files) have been organized by extension.
pause
goto organize

:choice
cls
echo %cdc%----------------------------------------------------------------%cr%
echo Rename file extensions %cdr%(Unfinished)%cr%
echo %cdc%----------------------------------------------------------------%cr%
echo Type %cdy%change%cr% to %cdg%CHANGE%cr% File extensions
echo Type %cdy%restore%cr% to %cdr%REVERT%cr% File extensions
echo Type %cdy%leave%cr% to %cdc%LEAVE%cr% this program
echo %cdc%----------------------------------------------------------------%cr%
set /p input=Command:-$

if "%input%"=="change" goto safe
if "%input%"=="restore" goto unsafe
if "%input%"=="exit" exit
if "%input%"=="leave" goto main
goto choice

:safe
:: Rename all *.txt files to *.xx
for /R %%d in (.) do (
    pushd "%%d"
    ren *.txt *.xxt
	ren *.png *.xng
	ren *.jpg *.xpg
    popd
)

:: Optional: Display a message
echo All files have been renamed to .xx extension.
pause
goto choice

:unsafe
:: Reinstate default File extensions
for /R %%d in (.) do (
	pushd "%%d"
	ren *.xxt *.txt
	ren *.xng *.png
	ren *.xpg *.jpg
	popd
)

:: Optional: Display a message
echo All file extensions have been restored.
pause
goto choice

:colors
cls
echo %cdr%%bbb%test%cr%
echo %cdg%%bbb%test%cr%
echo %cdy%%bbb%test%cr%
echo %cdb%%bbb%test%cr%
echo %cdm%%bbb%test%cr%
echo %cdc%%bbb%test%cr%
echo %cdw%%bbb%test%cr%
pause
goto main

:exit
cls
echo ------------------------------
echo Are you sure you want to LEAVE?
echo ------------------------------
echo Type Y and press ENTER for yes
echo Type N and press ENTER for no
echo ------------------------------
set /p input=Exit?

if "%input%"=="y" goto main
if "%input%"=="n" goto choice

echo No option was chosen. Returning.
pause
goto choice

:leave
exit