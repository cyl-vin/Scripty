@echo off
setlocal enabledelayedexpansion

:main
title Cylvin's Collection Of Batch Programs
cls
echo ----------------------------------------------------------------
echo Type the number of the option you want to choose and press ENTER
echo ----------------------------------------------------------------
echo 1.) Check internet status
echo 2.) Organize some files in this directory
echo 3.) Change file extensions in this directory
echo 0.) EXIT
echo ----------------------------------------------------------------
echo Type Exit to close this program from anywhere
echo Type Leave anywhere to come back to this menu
echo ----------------------------------------------------------------
set /p input=Main Menu:-$

if "%input%"=="0" exit
if "%input%"=="1" goto pingcheck
if "%input%"=="2" goto organize
if "%input%"=="3" goto choice
if "%input%"=="exit" exit
goto main

:pingcheck
title Checking Connectivity
cls
echo ----------------------------------------------------------------
echo Type a website URL or IP Address
echo below to check if you are connected to
echo the internet or that device IP
echo ----------------------------------------------------------------
echo Type leave to go to the main menu
echo ----------------------------------------------------------------
set /p "data=Website:-$ "

if "%data%"=="exit" exit
if "%data%"=="leave" goto main

ping !data!
pause
goto pingcheck

:organize
cls

echo ----------------------------------------------------------------
echo How would You like to Organize the files in this directory?
echo ----------------------------------------------------------------
echo Type X to organize all files by extension into sperate folders
echo Type video to organize video files into a folder called "Videos"
echo Type image to organize image files into a folder called "Images"
echo Type Leave and hit ENTER to go to the Main Menu
echo Type Exit and hit ENTER to exit this program
echo ----------------------------------------------------------------
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
echo ----------------------------------------------------------------
echo Rename file extensions (Unfinished)
echo ----------------------------------------------------------------
echo Type change to CHANGE File extensions
echo Type restore to REVERT to original File extensions
echo Type leave to LEAVE this program
echo ----------------------------------------------------------------
set /p input=COMMAND?

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

:exit
cls
echo ----------------------------------------------------------------
echo Are you sure you want to LEAVE?
echo ----------------------------------------------------------------
echo Type Y and press ENTER for yes
echo Type N and press ENTER for no
echo ----------------------------------------------------------------
set /p input=Exit?

if "%input%"=="y" goto main
if "%input%"=="n" goto choice

echo No option was chosen. Returning.
pause
goto choice

:leave
exit