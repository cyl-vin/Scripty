@echo off
setlocal enabledelayedexpansion

:main
title Scripty coded by cylvin
cls
echo ----------------------------------------------------------------
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.4
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
set /p "input=Main Menu:-$ "

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
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.4
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
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.4
echo ----------------------------------------------------------------
echo How would You like to Organize the files in this directory?
echo ----------------------------------------------------------------
echo Type x to organize all files by extension into sperate folders
echo Type m to organize most files by general type into seperate folders
echo (combines video, audio, image, text, present, exe, disc, zip into one command)
echo Type video to organize video files into a folder called "Videos"
echo Type audio to organize audio files into a folder called "Audio"
echo Type image to organize image files into a folder called "Images"
echo Type text to organize text-based files into a folder called "Documents"
echo Type present to organize presentation files into a folder called "Presentation"
echo Type exe to organize executable files into a folder called "Executables"
echo Type disc to organize Disc/Media files into a folder called "Disc_Images"
echo Type zip to organize compressed file types into a folder called "Compressed_Files"
echo Type Leave and hit ENTER to go to the Main Menu
echo Type Exit and hit ENTER to exit this program
echo ----------------------------------------------------------------
set /p "input=Batch:-$ "

if "%input%"=="x" goto extension
if "%input%"=="m" goto organize_most
if "%input%"=="video" goto video
if "%input%"=="audio" goto audio
if "%input%"=="image" goto image
if "%input%"=="text" goto text
if "%input%"=="present" goto pres
if "%input%"=="exe" goto executables
if "%input%"=="disc" goto disc_images
if "%input%"=="zip" goto compress
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
for %%F in ("%rootdir%\*.3g2" "%rootdir%\*.3gp" "%rootdir%\*.avi" "%rootdir%\*.flv" "%rootdir%\*.h264" "%rootdir%\*.m4v" "%rootdir%\*.mkv" "%rootdir%\*.mov" "%rootdir%\*.mp4" "%rootdir%\*.mpg" "%rootdir%\*.mpeg" "%rootdir%\*.rm" "%rootdir%\*.swf" "%rootdir%\*.vob" "%rootdir%\*.webm" "%rootdir%\*.wmv") do (
    move "%%F" "!rootdir!\Videos"
)

echo Video files have been moved to the 'Videos' folder.
pause
goto organize

:audio
cls
:: Get the current directory where the batch script is located
set "rootdir=%~dp0"

:: Create "Videos" folder if it doesn't exist
if not exist "!rootdir!\Audio" (
    mkdir "!rootdir!\Audio"
)

:: Move audio files (might add more extensions)
for %%F in ("%rootdir%\*.aif" "%rootdir%\*.cda" "%rootdir%\*.mid" "%rootdir%\*.midi" "%rootdir%\*.mp3" "%rootdir%\*.mpa" "%rootdir%\*.ogg" "%rootdir%\*.wav" "%rootdir%\*.wma" "%rootdir%\*.wpl") do (
    move "%%F" "!rootdir!\Audio"
)

echo Audio files have been moved to the 'Audio' folder.
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
for %%F in ( "%rootdir%\*.ai" "%rootdir%\*.jpg" "%rootdir%\*.png" "%rootdir%\*.bmp" "%rootdir%\*.gif" "%rootdir%\*.ico" "%rootdir%\*.jpeg" "%rootdir%\*.tif" "%rootdir%\*.tiff" "%rootdir%\*.ps" "%rootdir%\*.psd" "%rootdir%\*.svg" "%rootdir%\*.webp") do (
    move "%%F" "!rootdir!\Images"
)

echo Image files have been moved to the 'Images' folder.
pause
goto organize

:text
cls
:: Get the current directory where the batch script is located
set "rootdir=%~dp0"

:: Create "Documents" folder if it doesn't exist
if not exist "!rootdir!\Documents" (
    mkdir "!rootdir!\Documents"
)

:: Move text files (might add more extensions)
for %%F in ("%rootdir%\*.txt" "%rootdir%\*.rtf" "%rootdir%\*.tex" "%rootdir%\*.doc" "%rootdir%\*.docx" "%rootdir%\*.pdf" "%rootdir%\*.odt" "%rootdir%\*.aspx" "%rootdir%\*.cer" "%rootdir%\*.cfm" "%rootdir%\*.csr" "%rootdir%\*.html" "%rootdir%\*.htm" "%rootdir%\*.xls" "%rootdir%\*.xlsx" "%rootdir%\*.wpd") do (
    move "%%F" "!rootdir!\Documents"
)

echo Text-based files have been moved to the 'Documents' folder.
pause
goto organize

:pres
cls
:: Get the current directory where the batch script is located
set "rootdir=%~dp0"

:: Create "Presentation" folder if it doesn't exist
if not exist "!rootdir!\Presentation" (
    mkdir "!rootdir!\Presentation"
)

:: Move Presentation files (might add more extensions)
for %%F in ("%rootdir%\*.ppt" "%rootdir%\*.pptx" "%rootdir%\*.pps" "%rootdir%\*.odp" "%rootdir%\*.key") do (
    move "%%F" "!rootdir!\Presentation"
)

echo Presentation files have been moved to the 'Presentation' folder.
pause
goto organize

:executables
cls
:: Get the current directory where the batch script is located
set "rootdir=%~dp0"

:: Create "Executables" folder if it doesn't exist
if not exist "!rootdir!\Executables" (
    mkdir "!rootdir!\Executables"
)

:: Move Executable files (might add more extensions)
for %%F in ("%rootdir%\*.apk" "%rootdir%\*.cgi" "%rootdir%\*.pl" "%rootdir%\*.com" "%rootdir%\*.exe" "%rootdir%\*.gadget" "%rootdir%\*.jar" "%rootdir%\*.msi" "%rootdir%\*.py" "%rootdir%\*.wsf") do (
    move "%%F" "!rootdir!\Executables"
)

echo Executable files have been moved to the 'Executables' folder.
pause
goto organize

:disc_images
cls
:: Get the current directory where the batch script is located
set "rootdir=%~dp0"

:: Create "Disc_Images" folder if it doesn't exist
if not exist "!rootdir!\Disc_Images" (
    mkdir "!rootdir!\Disc_Images"
)

:: Move Disc/Media files (might add more extensions)
for %%F in ("%rootdir%\*.bin" "%rootdir%\*.dmg" "%rootdir%\*.iso" "%rootdir%\*.toast" "%rootdir%\*.vcd") do (
    move "%%F" "!rootdir!\Disc_Images"
)

echo Disc/Media files have been moved to the 'Disc_Images' folder.
pause
goto organize

:compress
cls
:: Get the current directory where the batch script is located
set "rootdir=%~dp0"

:: Create "Compressed Files" folder if it doesn't exist
if not exist "!rootdir!\Compressed_Files" (
    mkdir "!rootdir!\Compressed_Files"
)

:: Move compressed files (might add more extensions)
for %%F in ("%rootdir%\*.7z" "%rootdir%\*.arj" "%rootdir%\*.deb" "%rootdir%\*.pkg" "%rootdir%\*.rar" "%rootdir%\*.rpm" "%rootdir%\*.tar.gz" "%rootdir%\*.z" "%rootdir%\*.zip") do (
    move "%%F" "!rootdir!\Compressed_Files"
)

echo Compressed file types have been moved to the 'Compressed_Files' folder.
pause
goto organize

:organize_most
cls
:: Get the current directory where the batch script is located
set "rootdir=%~dp0"

:: Create necessary folders for sorting if they don't exist
if not exist "!rootdir!\Videos" (
    mkdir "!rootdir!\Videos"
)
if not exist "!rootdir!\Audio" (
    mkdir "!rootdir!\Audio"
)
if not exist "!rootdir!\Images" (
    mkdir "!rootdir!\Images"
)
if not exist "!rootdir!\Documents" (
    mkdir "!rootdir!\Documents"
)
if not exist "!rootdir!\Presenation" (
    mkdir "!rootdir!\Presentation"
)
if not exist "!rootdir!\Executables" (
    mkdir "!rootdir!\Executables"
)
if not exist "!rootdir!\Disc_Images" (
    mkdir "!rootdir!\Disc_Images"
)
if not exist "!rootdir!\Compressed_files" (
    mkdir "!rootdir!\Compressed_Files"
)

:: Move all of the files
for %%F in ("%rootdir%\*.3g2" "%rootdir%\*.3gp" "%rootdir%\*.avi" "%rootdir%\*.flv" "%rootdir%\*.h264" "%rootdir%\*.m4v" "%rootdir%\*.mkv" "%rootdir%\*.mov" "%rootdir%\*.mp4" "%rootdir%\*.mpg" "%rootdir%\*.mpeg" "%rootdir%\*.rm" "%rootdir%\*.swf" "%rootdir%\*.vob" "%rootdir%\*.webm" "%rootdir%\*.wmv") do (
    move "%%F" "!rootdir!\Videos"
)
for %%F in ("%rootdir%\*.aif" "%rootdir%\*.cda" "%rootdir%\*.mid" "%rootdir%\*.midi" "%rootdir%\*.mp3" "%rootdir%\*.mpa" "%rootdir%\*.ogg" "%rootdir%\*.wav" "%rootdir%\*.wma" "%rootdir%\*.wpl") do (
    move "%%F" "!rootdir!\Audio"
)
for %%F in ( "%rootdir%\*.ai" "%rootdir%\*.jpg" "%rootdir%\*.png" "%rootdir%\*.bmp" "%rootdir%\*.gif" "%rootdir%\*.ico" "%rootdir%\*.jpeg" "%rootdir%\*.tif" "%rootdir%\*.tiff" "%rootdir%\*.ps" "%rootdir%\*.psd" "%rootdir%\*.svg" "%rootdir%\*.webp") do (
    move "%%F" "!rootdir!\Images"
)
for %%F in ("%rootdir%\*.txt" "%rootdir%\*.rtf" "%rootdir%\*.tex" "%rootdir%\*.doc" "%rootdir%\*.docx" "%rootdir%\*.pdf" "%rootdir%\*.odt" "%rootdir%\*.aspx" "%rootdir%\*.cer" "%rootdir%\*.cfm" "%rootdir%\*.csr" "%rootdir%\*.html" "%rootdir%\*.htm" "%rootdir%\*.xls" "%rootdir%\*.xlsx" "%rootdir%\*.wpd") do (
    move "%%F" "!rootdir!\Documents"
)
for %%F in ("%rootdir%\*.ppt" "%rootdir%\*.pptx" "%rootdir%\*.pps" "%rootdir%\*.odp" "%rootdir%\*.key") do (
    move "%%F" "!rootdir!\Presentation"
)
for %%F in ("%rootdir%\*.apk" "%rootdir%\*.cgi" "%rootdir%\*.pl" "%rootdir%\*.com" "%rootdir%\*.exe" "%rootdir%\*.gadget" "%rootdir%\*.jar" "%rootdir%\*.msi" "%rootdir%\*.py" "%rootdir%\*.wsf") do (
    move "%%F" "!rootdir!\Executables"
)
for %%F in ("%rootdir%\*.bin" "%rootdir%\*.dmg" "%rootdir%\*.iso" "%rootdir%\*.toast" "%rootdir%\*.vcd") do (
    move "%%F" "!rootdir!\Disc_Images"
)
for %%F in ("%rootdir%\*.7z" "%rootdir%\*.arj" "%rootdir%\*.deb" "%rootdir%\*.pkg" "%rootdir%\*.rar" "%rootdir%\*.rpm" "%rootdir%\*.tar.gz" "%rootdir%\*.z" "%rootdir%\*.zip") do (
    move "%%F" "!rootdir!\Compressed_Files"
)

echo All files have been moved to their respective folders.
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
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.4
echo ----------------------------------------------------------------
echo Rename file extensions (Unfinished)
echo ----------------------------------------------------------------
echo Type change to CHANGE File extensions
echo Type restore to REVERT to original File extensions
echo Type leave to LEAVE this program
echo ----------------------------------------------------------------
set /p "input=Command:-$ "

if "%input%"=="change" goto safe
if "%input%"=="restore" goto unsafe
if "%input%"=="exit" exit
if "%input%"=="leave" goto main
goto choice

:safe
:: Rename all *.txt files to *.xx
for /R %%d in (.) do (
    pushd "%%d"
    ren *.aif *.196
	ren *.cda *.341
	ren *.mid *.1394
	ren *.midi *.139413
	ren *.mp3 *.1316d
	ren *.mpa *.13161
	ren *.ogg *.1577
	ren *.wav *.23122
	ren *.wma *.23131
	ren *.wpl *.231612
	ren *.7z *.g26
	ren *.arj *.11810
	ren *.deb *.452
	ren *.pkg *.16117
	ren *.rar *.18118
	ren *.rpm *.181613
	ren *.gz *.726
	ren *.z *.26
	ren *.zip *.26916
	ren *.bin *.2914
	ren *.dmg *.4137
	ren *.iso *.91915
	ren *.toast *.201511920
	ren *.vcd *.2234
	ren *.csv *.31922
	ren *.dat *.4120
	ren *.db *.42
	ren *.dbf *.426
	ren *.log *.12157
	ren *.mdb *.1342
	ren *.sav *.19122
	ren *.sql *.191712
	ren *.tar *.20118
	ren *.xml *.241312
	ren *.email *.5131912
	ren *.eml *.51312
	ren *.emlx *.5131224
	ren *.msg *.13197
	ren *.oft *.15620
	ren *.ost *.151920
	ren *.pst *.161920
	ren *.vcf *.2236
	ren *.apk *.11611
	ren *.bin *.2914
	ren *.cgi *.379
	ren *.pl *.1612
	ren *.com *.31513
	ren *.exe *.5245
	ren *.gadget *.7147520
	ren *.jar *.10118
	ren *.msi *.13199
	ren *.py *.1625
	ren *.wsf *.23196
	ren *.fnt *.61420
	ren *.fon *.61514
	ren *.otf *.15206
	ren *.ttf *.20206
	ren *.ai *.19
	ren *.bmp *.21316
	ren *.gif *.796
	ren *.ico *.9315
	ren *.jpeg *.101657
	ren *.jpg *.1057
	ren *.png *.16147
	ren *.ps *.1619
	ren *.psd *.16194
	ren *.svg *.19227
	ren *.tif *.2096
	ren *.tiff *.20966
	ren *.webp *.235216
	ren *.asp *.11916
	ren *.aspx *.1191624
	ren *.cer *.3518
	ren *.cfm *.3613
	ren *.css *.31919
	ren *.htm *.82013
	ren *.html *.8201312
	ren *.js *.1019
	ren *.jsp *.101916
	ren *.part *.1611820
	ren *.php *.16816
	ren *.rss *.181919
	ren *.xhtml *.248201312
	ren *.key *.11525
	ren *.odp *.15416
	ren *.pps *.161619
	ren *.ppt *.161620
	ren *.pptx *.16162024
	ren *.c *.3
	ren *.class *.31211919
	ren *.cpp *.31616
	ren *.cs *.319
	ren *.h *.8
	ren *.java *.101221
	ren *.sh *.198
	ren *.swift *.19239620
	ren *.vb *.222
	ren *.ods *.15419
	ren *.xls *.241219
	ren *.xlsx *.24121924
	ren *.xlsm *.24121913
	ren *.bak *.2111
	ren *.cab *.312
	ren *.cfg *.367
	ren *.cpl *.31612
	ren *.cur *.32118
	ren *.dll *.41212
	ren *.dmp *.41316
	ren *.drv *.41822
	ren *.icns *.931419
	ren *.ini *.9149
	ren *.lnk *.121411
	ren *.sys *.192519
	ren *.tmp *.201316
	ren *.3g2 *.c7b
	ren *.3gp *.c716
	ren *.avi *.1229
	ren *.flv *.61222
	ren *.h264 *.8bfd
	ren *.m4v *.13d22
	ren *.mkv *.131122
	ren *.mov *.131522
	ren *.mp4 *.1316d
	ren *.mpg *.13167
	ren *.mpeg *.131657
	ren *.rm *.1813
	ren *.swf *.19236
	ren *.vob *.22152
	ren *.webm *.235213
	ren *.wmv *.231322
	ren *.doc *.4153
	ren *.docx *.415324
	ren *.odt *.15420
	ren *.pdf *.1646
	ren *.rtf *.18206
	ren *.tex *.20524
	ren *.txt *.202420
	ren *.wpd *.23164
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
	ren *.196 *.aif 
	ren *.341 *.cda
	ren *.1394 *.mid
	ren *.139413 *.midi
	ren *.1316d *.mp3
	ren *.13161 *.mpa
	ren *.1577 *.ogg
	ren *.23122 *.wav
	ren *.23131 *.wma
	ren *.231612 *.wpl
	ren *.g26 *.7z
	ren *.11810 *.arj
	ren *.452 *.deb
	ren *.16117 *.pkg
	ren *.18118 *.rar
	ren *.181613 *.rpm
	ren *.726 *.gz
	ren *.26 *.z
	ren *.26916 *.zip
	ren *.2914 *.bin
	ren *.4137 *.dmg
	ren *.91915 *.iso
	ren *.201511920 *.toast
	ren *.2234 *.vcd
	ren *.31922 *.csv
	ren *.4120 *.dat
	ren *.42 *.db
	ren *.426 *.dbf
	ren *.12157 *.log
	ren *.1342 *.mdb
	ren *.19122 *.sav
	ren *.191712 *.sql
	ren *.20118 *.tar
	ren *.241312 *.xml
	ren *.5131912 *.email
	ren *.51312 *.eml
	ren *.5131224 *.emlx
	ren *.13197 *.msg
	ren *.15620 *.oft
	ren *.151920 *.ost
	ren *.161920 *.pst
	ren *.2236 *.vcf
	ren *.11611 *.apk
	ren *.2914 *.bin
	ren *.379 *.cgi
	ren *.1612 *.pl
	ren *.31513 *.com
	ren *.5245 *.exe
	ren *.7147520 *.gadget
	ren *.10118 *.jar
	ren *.13199 *.msi
	ren *.1625 *.py
	ren *.23196 *.wsf
	ren *.61420 *.fnt
	ren *.61514 *.fon
	ren *.15206 *.otf
	ren *.20206 *.ttf
	ren *.19 *.ai
	ren *.21316 *.bmp
	ren *.796 *.gif
	ren *.9315 *.ico
	ren *.101657 *.jpeg
	ren *.1057 *.jpg
	ren *.16147 *.png
	ren *.1619 *.ps
	ren *.16194 *.psd
	ren *.19227 *.svg
	ren *.2096 *.tif
	ren *.20966 *.tiff
	ren *.235216 *.webp
	ren *.11916 *.asp
	ren *.1191624 *.aspx
	ren *.3518 *.cer
	ren *.3613 *.cfm
	ren *.31919 *.css
	ren *.82013 *.htm
	ren *.8201312 *.html
	ren *.1019 *.js
	ren *.101916 *.jsp
	ren *.1611820 *.part
	ren *.16816 *.php
	ren *.181919 *.rss
	ren *.248201312 *.xhtml
	ren *.11525 *.key
	ren *.15416 *.odp
	ren *.161619 *.pps
	ren *.161620 *.ppt
	ren *.16162024 *.pptx
	ren *.3 *.c
	ren *.31211919 *.class
	ren *.31616 *.cpp
	ren *.319 *.cs
	ren *.8 *.h
	ren *.101221 *.java
	ren *.198 *.sh
	ren *.19239620 *.swift
	ren *.222 *.vb
	ren *.15419 *.ods
	ren *.241219 *.xls
	ren *.24121924 *.xlsx
	ren *.24121913 *.xlsm
	ren *.2111 *.bak
	ren *.312 *.cab
	ren *.367 *.cfg
	ren *.31612 *.cpl
	ren *.32118 *.cur
	ren *.41212 *.dll
	ren *.41316 *.dmp
	ren *.41822 *.drv
	ren *.931419 *.icns
	ren *.9149 *.ini
	ren *.121411 *.lnk
	ren *.192519 *.sys
	ren *.201316 *.tmp
	ren *.c7b *.3g2
	ren *.c716 *.3gp
	ren *.1229 *.avi
	ren *.61222 *.flv
	ren *.8bfd *.h264
	ren *.13d22 *.m4v
	ren *.131122 *.mkv
	ren *.131522 *.mov
	ren *.1316d *.mp4
	ren *.13167 *.mpg
	ren *.131657 *.mpeg
	ren *.1813 *.rm
	ren *.19236 *.swf
	ren *.22152 *.vob
	ren *.235213 *.webm
	ren *.231322 *.wmv
	ren *.4153 *.doc
	ren *.415324 *.docx
	ren *.15420 *.odt
	ren *.1646 *.pdf
	ren *.18206 *.rtf
	ren *.20524 *.tex
	ren *.202420 *.txt
	ren *.23164 *.wpd
	popd
)

:: Optional: Display a message
echo All file extensions have been restored.
pause
goto choice

:exit
cls
echo ----------------------------------------------------------------
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.4
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