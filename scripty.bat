@echo off
setlocal enabledelayedexpansion

REM Define color codes
REM Dark Red foreground
set "cdr=%ESC%[31m"
REM Dark Green foreground
set "cdg=%ESC%[32m"
REM Dark Yellow foreground
set "cdy=%ESC%[33m"
REM Dark Blue foreground
set "cdb=%ESC%[34m"
REM Dark Magenta foreground
set "cdm=%ESC%[35m"
REM Dark Cyan foreground
set "cdc=%ESC%[36m"
REM Dark White foreground
set "cdw=%ESC%[37m"
REM Bright Black foreground
set "cbb=%ESC%[90m"
REM Bright Red foreground
set "cbr=%ESC%[91m"
REM Bright Green foreground
set "cbg=%ESC%[92m"
REM Bright Yellow foreground
set "cby=%ESC%[93m"
REM Bright Blue foreground
set "fbb=%ESC%[94m"
REM Bright Magenta foreground
set "cbm=%ESC%[95m"
REM Bright Cyan foreground
set "cbc=%ESC%[96m"
REM White foreground
set "cw=%ESC%[97m"
REM Background Black
set "bb=%ESC%[40m"
REM Background Dark Red
set "bdr=%ESC%[41m"
REM Background Dark Green
set "bdg=%ESC%[42m"
REM Background Dark Yellow
set "bdy=%ESC%[43m"
REM Background Dark Blue
set "bdb=%ESC%[44m"
REM Background dark Magenta
set "bdm=%ESC%[45m"
REM Background Dark Cyan
set "bdc=%ESC%[46m"
REM Background Dark White
set "bdw=%ESC%[47m"
REM Background Light Black
set "blb=%ESC%[100m"
REM Background Bright Red
set "bbr=%ESC%[101m"
REM Background Bright Green
set "bbg=%ESC%[102m"
REM Background Bright Yellow
set "bby=%ESC%[103m"
REM Background Bright Blue
set "bbb=%ESC%[104m"
REM Background Bright Magenta
set "bbm=%ESC%[105m"
REM Background Bright Cyan
set "bbc=%ESC%[106m"
REM Background Background White
set "bw=%ESC%[107m"
REM Bold
set "bold=%ESC%[1m"
REM Underline
set "u=%ESC%[4m"
REM No Underline
set "nu=%ESC%[24m"
REM Reverse Text
set "rt=%ESC%[7m"
REM Positive Text (Not reversed)
set "pt=%ESC%[27m"
REM Color Reset
set "cr=%ESC%[0m"

:main
title Scripty coded by cylvin
cls
echo ----------------------------------------------------------------
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.8
echo ----------------------------------------------------------------
echo Type the number of the option you want to choose and press ENTER
echo ----------------------------------------------------------------
echo 1.) Check internet status
echo 2.) Organize some files in this directory
echo 3.) Change file extensions in this directory
echo 4.) Generate a password of any length (includes special chars.)
echo 5.) Terminal color test
echo 6.) MiniTweaks
echo 7.) View Saved WiFi Passwords
echo 8.) Remove Temporary files and empty Recycle Bin
echo 9.) Give Scripty Admin Privileges (Relaunches Scripty w/ Admin)
echo 0.) EXIT AND CLOSE SCRIPTY
echo ----------------------------------------------------------------
echo Type Exit to close Scripty from anywhere
echo Type Leave anywhere to come back to this menu
echo ----------------------------------------------------------------
set /p "maininput=Main Menu:-$ "

if "%maininput%"=="0" exit
if "%maininput%"=="1" goto pingcheck
if "%maininput%"=="2" goto organize
if "%maininput%"=="3" goto choice
if "%maininput%"=="4" goto passgen
if "%maininput%"=="5" goto colors
if "%maininput%"=="6" goto minitweaks
if "%maininput%"=="7" goto wifipass
if "%maininput%"=="8" goto cleanup
if "%maininput%"=="9" goto main_get_admin
if /i "%maininput%"=="exit" goto exiter

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
echo                 /_/        /____/ v0.8
echo ----------------------------------------------------------------
echo Type a website URL or IP Address
echo below to check if you are connected to
echo the internet or that device IP
echo ----------------------------------------------------------------
echo Type leave to go to the main menu
echo Type exit to close Scripty
echo ----------------------------------------------------------------
set /p "webip=Website:-$ "

if /i "%webip%"=="exit" goto exiter
if /i "%webip%"=="leave" goto main

ping !webip!
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
echo                 /_/        /____/ v0.8
echo ----------------------------------------------------------------
echo How would You like to Organize the files in this directory?
echo ----------------------------------------------------------------
echo 1.) Sort all files by extension into sperate folders
echo 2.) Sort most files by type into seperate folders
echo (Option 2 combines options below into one command)
echo ----------------------------------------------------------------
echo Type video to move video files into "Videos"
echo Type audio to move audio files into "Audio"
echo Type image to move image files into "Images"
echo Type text to move text-based files into "Documents"
echo Type present to move presentation files into "Presentation"
echo Type exe to move executable files into "Executables"
echo Type disc to move Disc/Media files into "Disc_Images"
echo Type zip to move compressed file types into "Compressed_Files"
echo Type Leave and hit ENTER to go to the Main Menu
echo Type Exit and hit ENTER to leave Scripty
echo ----------------------------------------------------------------
set /p "organizer=Batch:-$ "

if "%organizer%"=="1" goto extension
if "%organizer%"=="2" goto organize_most
if /i "%organizer%"=="video" goto video
if /i "%organizer%"=="audio" goto audio
if /i "%organizer%"=="image" goto image
if /i "%organizer%"=="text" goto text
if /i "%organizer%"=="present" goto pres
if /i "%organizer%"=="exe" goto executables
if /i "%organizer%"=="disc" goto disc_images
if /i "%organizer%"=="zip" goto compress
if /i "%organizer%"=="exit" goto exiter
if /i "%organizer%"=="leave" goto main
goto organize

:video
cls
REM Get the current directory where the batch script is located
set "rootdir=%~dp0"

REM Create "Videos" folder if it doesn't exist
2>nul mkdir "!rootdir!\Videos"

REM Move video files (might add more extensions)
for %%F in ("%rootdir%\*.3g2" "%rootdir%\*.3gp" "%rootdir%\*.avi" "%rootdir%\*.flv" "%rootdir%\*.h264" "%rootdir%\*.m4v" "%rootdir%\*.mkv" "%rootdir%\*.mov" "%rootdir%\*.mp4" "%rootdir%\*.mpg" "%rootdir%\*.mpeg" "%rootdir%\*.rm" "%rootdir%\*.swf" "%rootdir%\*.vob" "%rootdir%\*.webm" "%rootdir%\*.wmv") do (
    move "%%F" "!rootdir!\Videos"
)

echo Video files have been moved to the 'Videos' folder.
pause
goto organize

:audio
cls
REM Get the current directory where the batch script is located
set "rootdir=%~dp0"

REM Create "Videos" folder if it doesn't exist
2>nul mkdir "!rootdir!\Audio"

REM Move audio files (might add more extensions)
for %%F in ("%rootdir%\*.aif" "%rootdir%\*.cda" "%rootdir%\*.mid" "%rootdir%\*.midi" "%rootdir%\*.mp3" "%rootdir%\*.mpa" "%rootdir%\*.ogg" "%rootdir%\*.wav" "%rootdir%\*.wma" "%rootdir%\*.wpl") do (
    move "%%F" "!rootdir!\Audio"
)

echo Audio files have been moved to the 'Audio' folder.
pause
goto organize

:image
cls
REM Get the current directory where the batch script is located
set "rootdir=%~dp0"

REM Create "Images" folder if it doesn't exist
2>nul mkdir "!rootdir!\Images"

REM Move picture files (might add more extensions)
for %%F in ( "%rootdir%\*.ai" "%rootdir%\*.jpg" "%rootdir%\*.png" "%rootdir%\*.bmp" "%rootdir%\*.gif" "%rootdir%\*.ico" "%rootdir%\*.jpeg" "%rootdir%\*.tif" "%rootdir%\*.tiff" "%rootdir%\*.ps" "%rootdir%\*.psd" "%rootdir%\*.svg" "%rootdir%\*.webp") do (
    move "%%F" "!rootdir!\Images"
)

echo Image files have been moved to the 'Images' folder.
pause
goto organize

:text
cls
REM Get the current directory where the batch script is located
set "rootdir=%~dp0"

REM Create "Documents" folder if it doesn't exist
2>nul mkdir "!rootdir!\Documents"

REM Move text files (might add more extensions)
for %%F in ("%rootdir%\*.txt" "%rootdir%\*.rtf" "%rootdir%\*.tex" "%rootdir%\*.doc" "%rootdir%\*.docx" "%rootdir%\*.pdf" "%rootdir%\*.odt" "%rootdir%\*.aspx" "%rootdir%\*.cer" "%rootdir%\*.cfm" "%rootdir%\*.csr" "%rootdir%\*.html" "%rootdir%\*.htm" "%rootdir%\*.xls" "%rootdir%\*.xlsx" "%rootdir%\*.wpd") do (
    move "%%F" "!rootdir!\Documents"
)

echo Text-based files have been moved to the 'Documents' folder.
pause
goto organize

:pres
cls
REM Get the current directory where the batch script is located
set "rootdir=%~dp0"

REM Create "Presentation" folder if it doesn't exist
2>nul mkdir "!rootdir!\Presentation"

REM Move Presentation files (might add more extensions)
for %%F in ("%rootdir%\*.ppt" "%rootdir%\*.pptx" "%rootdir%\*.pps" "%rootdir%\*.odp" "%rootdir%\*.key") do (
    move "%%F" "!rootdir!\Presentation"
)

echo Presentation files have been moved to the 'Presentation' folder.
pause
goto organize

:executables
cls
REM Get the current directory where the batch script is located
set "rootdir=%~dp0"

REM Create "Executables" folder if it doesn't exist
2>nul mkdir "!rootdir!\Executables"

REM Move Executable files (might add more extensions)
for %%F in ("%rootdir%\*.apk" "%rootdir%\*.cgi" "%rootdir%\*.pl" "%rootdir%\*.com" "%rootdir%\*.exe" "%rootdir%\*.gadget" "%rootdir%\*.jar" "%rootdir%\*.msi" "%rootdir%\*.py" "%rootdir%\*.wsf") do (
    move "%%F" "!rootdir!\Executables"
)

echo Executable files have been moved to the 'Executables' folder.
pause
goto organize

:disc_images
cls
REM Get the current directory where the batch script is located
set "rootdir=%~dp0"

REM Create "Disc_Images" folder if it doesn't exist
2>nul mkdir "!rootdir!\Disc_Images"

REM Move Disc/Media files (might add more extensions)
for %%F in ("%rootdir%\*.bin" "%rootdir%\*.dmg" "%rootdir%\*.iso" "%rootdir%\*.toast" "%rootdir%\*.vcd") do (
    move "%%F" "!rootdir!\Disc_Images"
)

echo Disc/Media files have been moved to the 'Disc_Images' folder.
pause
goto organize

:compress
cls
REM Get the current directory where the batch script is located
set "rootdir=%~dp0"

REM Create "Compressed Files" folder if it doesn't exist
2>nul mkdir "!rootdir!\Compressed_Files"

REM Move compressed files (might add more extensions)
for %%F in ("%rootdir%\*.7z" "%rootdir%\*.arj" "%rootdir%\*.deb" "%rootdir%\*.pkg" "%rootdir%\*.rar" "%rootdir%\*.rpm" "%rootdir%\*.tar.gz" "%rootdir%\*.z" "%rootdir%\*.zip") do (
    move "%%F" "!rootdir!\Compressed_Files"
)

echo Compressed file types have been moved to the 'Compressed_Files' folder.
pause
goto organize

:organize_most
cls
REM Get the current directory where the batch script is located
set "rootdir=%~dp0"

REM Create necessary folders for sorting if they don't exist
2>nul mkdir "!rootdir!\Videos"
2>nul mkdir "!rootdir!\Audio"
2>nul mkdir "!rootdir!\Images"
2>nul mkdir "!rootdir!\Documents"
2>nul mkdir "!rootdir!\Presentation"
2>nul mkdir "!rootdir!\Executables"
2>nul mkdir "!rootdir!\Disc_Images"
2>nul mkdir "!rootdir!\Compressed_Files"

REM Move all of the files
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
REM Get the current directory where the batch script is located
set "rootdir=%~dp0"

REM Create folders for each unique file extension
for %%F in ("%rootdir%\*.*") do (
    set "file=%%~nxF"
    set "ext=%%~xF"
    
    REM Skip batch files (modify this condition as needed)
    if /i "!ext!" NEQ ".bat" (
        2>nul mkdir "!rootdir!\!ext!"
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
echo                 /_/        /____/ v0.8
echo ----------------------------------------------------------------
echo Rename file extensions (Finished)
echo ----------------------------------------------------------------
echo 1.) CHANGE File extensions
echo 2.) REVERT to original File extensions
echo 3.) Main Menu
echo ----------------------------------------------------------------
set /p "rfe=Command:-$ "

if "%rfe%"=="1" goto safe
if "%rfe%"=="2" goto unsafe
if /i "%rfe%"=="exit" goto exiter
if "%rfe%"=="3" goto main
if /i "%rfe%"=="leave" goto main
goto choice

:safe
REM Rename all *.txt files to *.xx
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

REM Optional: Display a message
echo All files have been renamed to a different extension.
pause
goto choice

:unsafe
REM Reinstate default File extensions
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

REM Optional: Display a message
echo All file extensions have been restored.
pause
goto choice

:passgen
title Generate a password with alphanumeric and special characters
cls
echo ----------------------------------------------------------------
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.8
echo ----------------------------------------------------------------
echo Current Password Length: %passlength%
echo ----------------------------------------------------------------
echo 1.) Change the length of the password
echo 2.) Generate the password
echo 3.) Main Menu
echo ----------------------------------------------------------------
echo Generated Password: %passresult%
echo ----------------------------------------------------------------
echo %bold%%u%REMEMBER TO WRITE DOWN THE PASSWORD%cr%
echo ----------------------------------------------------------------

set /p "passgenerator=Password:-$ "

if "%passgenerator%"=="1" call :set_length
if "%passgenerator%"=="2" call :gen
if /i "%passgenerator%"=="exit" goto exiter
if /i "%passgenerator%"=="leave" goto main
goto passgen

:set_length
cls
echo ----------------------------------------------------------------
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.8
echo ----------------------------------------------------------------
echo Current Password Length: %passlength%
echo ----------------------------------------------------------------
echo 1.) Change the length of the password
echo 2.) Generate the password
echo 3.) Main Menu
echo ----------------------------------------------------------------
echo Generated Password: %passresult%
echo ----------------------------------------------------------------
set /p "passlength=Enter desired password length:-$ "

if /i "%passlength%"=="leave" (
	goto main
) else if /i "%passlength%"=="exit" (
	goto exiter
) else if "%passlength%"==* (
	goto passgen
)
goto passgen

:gen
cls
REM Define the characters for the alphanumeric string
set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz0123456789@@##$$**))((??..,,``~~--++]][[}}{{;;::"

REM Initialize the result string
set "passresult="

REM Generate the random string
for /L %%i in (1,1,%passlength%) do (
    set /a "random_index=!random! %% 110"
    for %%j in (!random_index!) do set "passresult=!passresult!!characters:~%%j,1!"
)
goto passgen

:minitweaks
Title MiniTweaks
cls
echo ----------------------------------------------------------------
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.8
echo ----------------------------------------------------------------
echo If changes don't take effect, launch Scripty as Administrator
echo or restart Windows Explorer using the option below
echo ----------------------------------------------------------------
echo 1.) Disable Windows Transparency (may need to type "yes")
echo 2.) Enable Windows Transparency (may need to type "yes")
echo 3.) Disable Xbox Game Bar (may need to type "yes" twice)
echo 4.) Enable Xbox Game Bar (may need to type "yes" twice)
echo 5.) Add Ultimate Performance Profile
echo 6.) Restart Windows Explorer
echo 7.) Main menu
echo 8.) Close and Exit Scripty
echo ----------------------------------------------------------------
echo %bold%WARNING: SOME OF THESE OPTIONS CHANGE REGISTRY VALUES%cr%
echo ----------------------------------------------------------------
set /p "minortweaks=Tweak:-$ "

if "%minortweaks%"=="1" goto disable_transparency
if "%minortweaks%"=="2" goto enable_transparency
if "%minortweaks%"=="3" goto disable_gamebar
if "%minortweaks%"=="4" goto enable_gamebar
if "%minortweaks%"=="5" goto add_ultimate_profile
if "%minortweaks%"=="6" start cmd /k "taskkill /IM explorer.exe /F && explorer.exe"
if "%minortweaks%"=="7" goto main
if "%minortweaks%"=="8" goto exiter
if /i "%minortweaks%"=="leave" goto main
if /i "%minortweaks%"=="exit" goto exiter
else if goto minitweaks
goto minitweaks

:disable_transparency
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 0
goto minitweaks

:enable_transparency
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 1
goto minitweaks

:disable_gamebar
REG ADD HKEY_CURRENT_USER\System\GameConfigStore /v GameDVR_Enabled /t REG_DWORD /d 0
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR /v AppCaptureEnabled /t REG_DWORD /d 0
goto minitweaks

:enable_gamebar
REG ADD HKEY_CURRENT_USER\System\GameConfigStore /v GameDVR_Enabled /t REG_DWORD /d 1
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR /v AppCaptureEnabled /t REG_DWORD /d 1
goto minitweaks

:add_ultimate_profile
cls
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
goto minitweaks

:wifipass
title View Saved WiFi Passwords
cls
echo ----------------------------------------------------------------
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.8
echo ----------------------------------------------------------------
echo If the password isn't visible you must Use option 2
echo ----------------------------------------------------------------
echo 1.) Show Saved Wireless Networks
echo 2.) Give Scripty Admin Privileges (Relaunches Scripty)
echo 3.) Main Menu
echo ----------------------------------------------------------------
echo Enter the Network name below to view the password
echo ----------------------------------------------------------------
set /p "passwifi=Network:-$ "

if "%passwifi%"=="1" goto show_saved_networks
if "%passwifi%"=="2" goto wifi_get_admin
if "%passwifi%"=="3" goto main
if /i "%passwifi%"=="leave" goto main
if /i "%passwifi%"=="exit" goto exiter

start cmd /k "netsh wlan show profile name="!passwifi!" key=clear"
goto wifipass

:show_saved_networks
cls
netsh wlan show profile
pause
goto wifipass

:wifi_get_admin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
    echo Requesting administrative privileges...
    goto wifi_UACPrompt
) else (
    goto wifi_gotAdmin
)

:wifi_UACPrompt
echo Set UAC = CreateObject("Shell.Application") > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %*", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:wifi_gotAdmin
echo Scripty is already running as Admin
pause
goto wifipass

:cleanup
cls
echo ----------------------------------------------------------------
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.8
echo ----------------------------------------------------------------
echo Clean Temporary Files and Empty Recycle Bin
echo ----------------------------------------------------------------
echo 1.) Clean Temporary Files
echo 2.) Empty Reycle Bin
echo 3.) Combine options 1 and 2
echo 4.) Main Menu
echo ----------------------------------------------------------------
echo Select an option and press ENTER
echo ----------------------------------------------------------------
set /p "cleaning=Clean:-$ "

if "%cleaning%"=="1" goto clean_temp
if "%cleaning%"=="2" goto empty_recycle
if "%cleaning%"=="3" goto combineclean
if "%cleaning%"=="4" goto main
if /i "%cleaning%"=="leave" goto main
if /i "%cleaning%"=="exit" goto exiter

goto cleanup

:clean_temp
cls
echo Removing Temporary Files...
del /f /q %temp%\*.*
timeout /t 2 >nul
goto cleanup

:empty_recycle
cls
echo Emptying the Reycling Bin...
rd /s /q %systemdrive%\$Recycle.Bin
timeout /t 2 >nul
goto cleanup

:combineclean
cls
echo Removing Temporary Files...
del /f /q %temp%\*.*
echo Emptying the Reycling Bin...
rd /s /q %systemdrive%\$Recycle.Bin
echo Done
timeout /t 2 >nul
goto cleanup

:main_get_admin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
    echo Requesting administrative privileges...
    goto main_UACPrompt
) else (
    goto main_gotAdmin
)

:main_UACPrompt
echo Set UAC = CreateObject("Shell.Application") > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %*", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:main_gotAdmin
echo Scripty is already running as Admin
pause
goto main

:exiter
title Close and exit Scripty?
cls
echo ----------------------------------------------------------------
echo    _____           _       __       Made By: cylvin
echo   / ___/__________(_)___  / /___  __  github.com/cyl-vin/Scripty
echo   \__ \/ ___/ ___/ / __ \/ __/ / / /
echo  ___/ / /__/ /  / / /_/ / /_/ /_/ / 
echo /____/\___/_/  /_/ .___/\__/\__, /  
echo                 /_/        /____/ v0.8
echo ----------------------------------------------------------------
echo Are you sure you want to LEAVE?
echo ----------------------------------------------------------------
echo Type Y and press ENTER for yes
echo Type N and press ENTER for no
echo ----------------------------------------------------------------
set /p "exiting=Exit?:-$ "

if /i "%exiting%"=="y" exit
if /i "%exiting%"=="n" goto main

echo No option was chosen. Returning.
pause
goto exiter


:colors
cls
echo %cdr%%bb%Testing all of the possible color combinations%cr%
echo %cdg%%bb%Testing all of the possible color combinations%cr%
echo %cdy%%bb%Testing all of the possible color combinations%cr%
echo %cdb%%bb%Testing all of the possible color combinations%cr%
echo %cdm%%bb%Testing all of the possible color combinations%cr%
echo %cdc%%bb%Testing all of the possible color combinations%cr%
echo %cdw%%bb%Testing all of the possible color combinations%cr%
echo %cbb%%bb%Testing all of the possible color combinations%cr%
echo %cbr%%bb%Testing all of the possible color combinations%cr%
echo %cbg%%bb%Testing all of the possible color combinations%cr%
echo %cby%%bb%Testing all of the possible color combinations%cr%
echo %fbb%%bb%Testing all of the possible color combinations%cr%
echo %cbm%%bb%Testing all of the possible color combinations%cr%
echo %cbc%%bb%Testing all of the possible color combinations%cr%
echo %cw%%bb%Testing all of the possible color combinations%cr%
echo %cdr%%bdr%Testing all of the possible color combinations%cr%
echo %cdg%%bdr%Testing all of the possible color combinations%cr%
echo %cdy%%bdr%Testing all of the possible color combinations%cr%
echo %cdb%%bdr%Testing all of the possible color combinations%cr%
echo %cdm%%bdr%Testing all of the possible color combinations%cr%
echo %cdc%%bdr%Testing all of the possible color combinations%cr%
echo %cdw%%bdr%Testing all of the possible color combinations%cr%
echo %cbb%%bdr%Testing all of the possible color combinations%cr%
echo %cbr%%bdr%Testing all of the possible color combinations%cr%
echo %cbg%%bdr%Testing all of the possible color combinations%cr%
echo %cby%%bdr%Testing all of the possible color combinations%cr%
echo %fbb%%bdr%Testing all of the possible color combinations%cr%
echo %cbm%%bdr%Testing all of the possible color combinations%cr%
echo %cbc%%bdr%Testing all of the possible color combinations%cr%
echo %cw%%bdr%Testing all of the possible color combinations%cr%
echo %cdr%%bdg%Testing all of the possible color combinations%cr%
echo %cdg%%bdg%Testing all of the possible color combinations%cr%
echo %cdy%%bdg%Testing all of the possible color combinations%cr%
echo %cdb%%bdg%Testing all of the possible color combinations%cr%
echo %cdm%%bdg%Testing all of the possible color combinations%cr%
echo %cdc%%bdg%Testing all of the possible color combinations%cr%
echo %cdw%%bdg%Testing all of the possible color combinations%cr%
echo %cbb%%bdg%Testing all of the possible color combinations%cr%
echo %cbr%%bdg%Testing all of the possible color combinations%cr%
echo %cbg%%bdg%Testing all of the possible color combinations%cr%
echo %cby%%bdg%Testing all of the possible color combinations%cr%
echo %fbb%%bdg%Testing all of the possible color combinations%cr%
echo %cbm%%bdg%Testing all of the possible color combinations%cr%
echo %cbc%%bdg%Testing all of the possible color combinations%cr%
echo %cw%%bdg%Testing all of the possible color combinations%cr%
echo %cdr%%bdy%Testing all of the possible color combinations%cr%
echo %cdg%%bdy%Testing all of the possible color combinations%cr%
echo %cdy%%bdy%Testing all of the possible color combinations%cr%
echo %cdb%%bdy%Testing all of the possible color combinations%cr%
echo %cdm%%bdy%Testing all of the possible color combinations%cr%
echo %cdc%%bdy%Testing all of the possible color combinations%cr%
echo %cdw%%bdy%Testing all of the possible color combinations%cr%
echo %cbb%%bdy%Testing all of the possible color combinations%cr%
echo %cbr%%bdy%Testing all of the possible color combinations%cr%
echo %cbg%%bdy%Testing all of the possible color combinations%cr%
echo %cby%%bdy%Testing all of the possible color combinations%cr%
echo %fbb%%bdy%Testing all of the possible color combinations%cr%
echo %cbm%%bdy%Testing all of the possible color combinations%cr%
echo %cbc%%bdy%Testing all of the possible color combinations%cr%
echo %cw%%bdy%Testing all of the possible color combinations%cr%
echo %cdr%%bdb%Testing all of the possible color combinations%cr%
echo %cdg%%bdb%Testing all of the possible color combinations%cr%
echo %cdy%%bdb%Testing all of the possible color combinations%cr%
echo %cdb%%bdb%Testing all of the possible color combinations%cr%
echo %cdm%%bdb%Testing all of the possible color combinations%cr%
echo %cdc%%bdb%Testing all of the possible color combinations%cr%
echo %cdw%%bdb%Testing all of the possible color combinations%cr%
echo %cbb%%bdb%Testing all of the possible color combinations%cr%
echo %cbr%%bdb%Testing all of the possible color combinations%cr%
echo %cbg%%bdb%Testing all of the possible color combinations%cr%
echo %cby%%bdb%Testing all of the possible color combinations%cr%
echo %fbb%%bdb%Testing all of the possible color combinations%cr%
echo %cbm%%bdb%Testing all of the possible color combinations%cr%
echo %cbc%%bdb%Testing all of the possible color combinations%cr%
echo %cw%%bdb%Testing all of the possible color combinations%cr%
echo %cdr%%bdm%Testing all of the possible color combinations%cr%
echo %cdg%%bdm%Testing all of the possible color combinations%cr%
echo %cdy%%bdm%Testing all of the possible color combinations%cr%
echo %cdb%%bdm%Testing all of the possible color combinations%cr%
echo %cdm%%bdm%Testing all of the possible color combinations%cr%
echo %cdc%%bdm%Testing all of the possible color combinations%cr%
echo %cdw%%bdm%Testing all of the possible color combinations%cr%
echo %cbb%%bdm%Testing all of the possible color combinations%cr%
echo %cbr%%bdm%Testing all of the possible color combinations%cr%
echo %cbg%%bdm%Testing all of the possible color combinations%cr%
echo %cby%%bdm%Testing all of the possible color combinations%cr%
echo %fbb%%bdm%Testing all of the possible color combinations%cr%
echo %cbm%%bdm%Testing all of the possible color combinations%cr%
echo %cbc%%bdm%Testing all of the possible color combinations%cr%
echo %cw%%bdm%Testing all of the possible color combinations%cr%
echo %cdr%%bdc%Testing all of the possible color combinations%cr%
echo %cdg%%bdc%Testing all of the possible color combinations%cr%
echo %cdy%%bdc%Testing all of the possible color combinations%cr%
echo %cdb%%bdc%Testing all of the possible color combinations%cr%
echo %cdm%%bdc%Testing all of the possible color combinations%cr%
echo %cdc%%bdc%Testing all of the possible color combinations%cr%
echo %cdw%%bdc%Testing all of the possible color combinations%cr%
echo %cbb%%bdc%Testing all of the possible color combinations%cr%
echo %cbr%%bdc%Testing all of the possible color combinations%cr%
echo %cbg%%bdc%Testing all of the possible color combinations%cr%
echo %cby%%bdc%Testing all of the possible color combinations%cr%
echo %fbb%%bdc%Testing all of the possible color combinations%cr%
echo %cbm%%bdc%Testing all of the possible color combinations%cr%
echo %cbc%%bdc%Testing all of the possible color combinations%cr%
echo %cw%%bdc%Testing all of the possible color combinations%cr%
echo %cdr%%bdw%Testing all of the possible color combinations%cr%
echo %cdg%%bdw%Testing all of the possible color combinations%cr%
echo %cdy%%bdw%Testing all of the possible color combinations%cr%
echo %cdb%%bdw%Testing all of the possible color combinations%cr%
echo %cdm%%bdw%Testing all of the possible color combinations%cr%
echo %cdc%%bdw%Testing all of the possible color combinations%cr%
echo %cdw%%bdw%Testing all of the possible color combinations%cr%
echo %cbb%%bdw%Testing all of the possible color combinations%cr%
echo %cbr%%bdw%Testing all of the possible color combinations%cr%
echo %cbg%%bdw%Testing all of the possible color combinations%cr%
echo %cby%%bdw%Testing all of the possible color combinations%cr%
echo %fbb%%bdw%Testing all of the possible color combinations%cr%
echo %cbm%%bdw%Testing all of the possible color combinations%cr%
echo %cbc%%bdw%Testing all of the possible color combinations%cr%
echo %cw%%bdw%Testing all of the possible color combinations%cr%
echo %cdr%%blb%Testing all of the possible color combinations%cr%
echo %cdg%%blb%Testing all of the possible color combinations%cr%
echo %cdy%%blb%Testing all of the possible color combinations%cr%
echo %cdb%%blb%Testing all of the possible color combinations%cr%
echo %cdm%%blb%Testing all of the possible color combinations%cr%
echo %cdc%%blb%Testing all of the possible color combinations%cr%
echo %cdw%%blb%Testing all of the possible color combinations%cr%
echo %cbb%%blb%Testing all of the possible color combinations%cr%
echo %cbr%%blb%Testing all of the possible color combinations%cr%
echo %cbg%%blb%Testing all of the possible color combinations%cr%
echo %cby%%blb%Testing all of the possible color combinations%cr%
echo %fbb%%blb%Testing all of the possible color combinations%cr%
echo %cbm%%blb%Testing all of the possible color combinations%cr%
echo %cbc%%blb%Testing all of the possible color combinations%cr%
echo %cw%%blb%Testing all of the possible color combinations%cr%
echo %cdr%%bbr%Testing all of the possible color combinations%cr%
echo %cdg%%bbr%Testing all of the possible color combinations%cr%
echo %cdy%%bbr%Testing all of the possible color combinations%cr%
echo %cdb%%bbr%Testing all of the possible color combinations%cr%
echo %cdm%%bbr%Testing all of the possible color combinations%cr%
echo %cdc%%bbr%Testing all of the possible color combinations%cr%
echo %cdw%%bbr%Testing all of the possible color combinations%cr%
echo %cbb%%bbr%Testing all of the possible color combinations%cr%
echo %cbr%%bbr%Testing all of the possible color combinations%cr%
echo %cbg%%bbr%Testing all of the possible color combinations%cr%
echo %cby%%bbr%Testing all of the possible color combinations%cr%
echo %fbb%%bbr%Testing all of the possible color combinations%cr%
echo %cbm%%bbr%Testing all of the possible color combinations%cr%
echo %cbc%%bbr%Testing all of the possible color combinations%cr%
echo %cw%%bbr%Testing all of the possible color combinations%cr%
echo %cdr%%bbg%Testing all of the possible color combinations%cr%
echo %cdg%%bbg%Testing all of the possible color combinations%cr%
echo %cdy%%bbg%Testing all of the possible color combinations%cr%
echo %cdb%%bbg%Testing all of the possible color combinations%cr%
echo %cdm%%bbg%Testing all of the possible color combinations%cr%
echo %cdc%%bbg%Testing all of the possible color combinations%cr%
echo %cdw%%bbg%Testing all of the possible color combinations%cr%
echo %cbb%%bbg%Testing all of the possible color combinations%cr%
echo %cbr%%bbg%Testing all of the possible color combinations%cr%
echo %cbg%%bbg%Testing all of the possible color combinations%cr%
echo %cby%%bbg%Testing all of the possible color combinations%cr%
echo %fbb%%bbg%Testing all of the possible color combinations%cr%
echo %cbm%%bbg%Testing all of the possible color combinations%cr%
echo %cbc%%bbg%Testing all of the possible color combinations%cr%
echo %cw%%bbg%Testing all of the possible color combinations%cr%
echo %cdr%%bby%Testing all of the possible color combinations%cr%
echo %cdg%%bby%Testing all of the possible color combinations%cr%
echo %cdy%%bby%Testing all of the possible color combinations%cr%
echo %cdb%%bby%Testing all of the possible color combinations%cr%
echo %cdm%%bby%Testing all of the possible color combinations%cr%
echo %cdc%%bby%Testing all of the possible color combinations%cr%
echo %cdw%%bby%Testing all of the possible color combinations%cr%
echo %cbb%%bby%Testing all of the possible color combinations%cr%
echo %cbr%%bby%Testing all of the possible color combinations%cr%
echo %cbg%%bby%Testing all of the possible color combinations%cr%
echo %cby%%bby%Testing all of the possible color combinations%cr%
echo %fbb%%bby%Testing all of the possible color combinations%cr%
echo %cbm%%bby%Testing all of the possible color combinations%cr%
echo %cbc%%bby%Testing all of the possible color combinations%cr%
echo %cw%%bby%Testing all of the possible color combinations%cr%
echo %cdr%%bbb%Testing all of the possible color combinations%cr%
echo %cdg%%bbb%Testing all of the possible color combinations%cr%
echo %cdy%%bbb%Testing all of the possible color combinations%cr%
echo %cdb%%bbb%Testing all of the possible color combinations%cr%
echo %cdm%%bbb%Testing all of the possible color combinations%cr%
echo %cdc%%bbb%Testing all of the possible color combinations%cr%
echo %cdw%%bbb%Testing all of the possible color combinations%cr%
echo %cbb%%bbb%Testing all of the possible color combinations%cr%
echo %cbr%%bbb%Testing all of the possible color combinations%cr%
echo %cbg%%bbb%Testing all of the possible color combinations%cr%
echo %cby%%bbb%Testing all of the possible color combinations%cr%
echo %fbb%%bbb%Testing all of the possible color combinations%cr%
echo %cbm%%bbb%Testing all of the possible color combinations%cr%
echo %cbc%%bbb%Testing all of the possible color combinations%cr%
echo %cw%%bbb%Testing all of the possible color combinations%cr%
echo %cdr%%bbm%Testing all of the possible color combinations%cr%
echo %cdg%%bbm%Testing all of the possible color combinations%cr%
echo %cdy%%bbm%Testing all of the possible color combinations%cr%
echo %cdb%%bbm%Testing all of the possible color combinations%cr%
echo %cdm%%bbm%Testing all of the possible color combinations%cr%
echo %cdc%%bbm%Testing all of the possible color combinations%cr%
echo %cdw%%bbm%Testing all of the possible color combinations%cr%
echo %cbb%%bbm%Testing all of the possible color combinations%cr%
echo %cbr%%bbm%Testing all of the possible color combinations%cr%
echo %cbg%%bbm%Testing all of the possible color combinations%cr%
echo %cby%%bbm%Testing all of the possible color combinations%cr%
echo %fbb%%bbm%Testing all of the possible color combinations%cr%
echo %cbm%%bbm%Testing all of the possible color combinations%cr%
echo %cbc%%bbm%Testing all of the possible color combinations%cr%
echo %cw%%bbm%Testing all of the possible color combinations%cr%
echo %cdr%%bbc%Testing all of the possible color combinations%cr%
echo %cdg%%bbc%Testing all of the possible color combinations%cr%
echo %cdy%%bbc%Testing all of the possible color combinations%cr%
echo %cdb%%bbc%Testing all of the possible color combinations%cr%
echo %cdm%%bbc%Testing all of the possible color combinations%cr%
echo %cdc%%bbc%Testing all of the possible color combinations%cr%
echo %cdw%%bbc%Testing all of the possible color combinations%cr%
echo %cbb%%bbc%Testing all of the possible color combinations%cr%
echo %cbr%%bbc%Testing all of the possible color combinations%cr%
echo %cbg%%bbc%Testing all of the possible color combinations%cr%
echo %cby%%bbc%Testing all of the possible color combinations%cr%
echo %fbb%%bbc%Testing all of the possible color combinations%cr%
echo %cbm%%bbc%Testing all of the possible color combinations%cr%
echo %cbc%%bbc%Testing all of the possible color combinations%cr%
echo %cw%%bbc%Testing all of the possible color combinations%cr%
echo %cdr%%bw%Testing all of the possible color combinations%cr%
echo %cdg%%bw%Testing all of the possible color combinations%cr%
echo %cdy%%bw%Testing all of the possible color combinations%cr%
echo %cdb%%bw%Testing all of the possible color combinations%cr%
echo %cdm%%bw%Testing all of the possible color combinations%cr%
echo %cdc%%bw%Testing all of the possible color combinations%cr%
echo %cdw%%bw%Testing all of the possible color combinations%cr%
echo %cbb%%bw%Testing all of the possible color combinations%cr%
echo %cbr%%bw%Testing all of the possible color combinations%cr%
echo %cbg%%bw%Testing all of the possible color combinations%cr%
echo %cby%%bw%Testing all of the possible color combinations%cr%
echo %fbb%%bw%Testing all of the possible color combinations%cr%
echo %cbm%%bw%Testing all of the possible color combinations%cr%
echo %cbc%%bw%Testing all of the possible color combinations%cr%
echo %cw%%bw%Testing all of the possible color combinations%cr%
pause
goto main


:leave
exit
