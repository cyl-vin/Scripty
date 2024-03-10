@echo off
setlocal enabledelayedexpansion
mode con: cols=65 lines=26
:main
title Scripty coded by cylvin
cls
echo [36m----------------------------------------------------------------[0m
echo [34m   _____           _       __         [0m      [33mMade By:[0m [34mcylvin[0m
echo [34m  / ___/__________(_)___  / /___  __  [0m[92mgithub.com/cyl-vin/Scripty[0m
echo [34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  [0m
echo [34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   [0m
echo [34m/____/\___/_/  /_/ .___/\__/\__, /    [0m
echo [34m                /_/        /____/[0m v1.0
echo [36m----------------------------------------------------------------[0m
echo Type the number of the option you want to choose and press [32mENTER[0m
echo [36m----------------------------------------------------------------[0m
echo [33m1.)[0m Check internet status
echo [33m2.)[0m Organize some files in this directory
echo [33m3.)[0m Change file extensions in this directory
echo [33m4.)[0m Generate a password of any length (includes special chars.)
echo [33m5.)[0m MiniTweaks
echo [33m6.)[0m View Saved WiFi Passwords
echo [33m7.)[0m Remove Temporary files and empty Recycle Bin
echo [33m8.)[0m Give Scripty Admin Privileges (Relaunches Scripty w/ Admin)
echo [33m0.)[0m EXIT AND CLOSE SCRIPTY
echo [36m----------------------------------------------------------------[0m
echo Type [91mExit[0m to close [34mScripty[0m from anywhere
echo Type [96mLeave[0m anywhere to come back to this menu
echo [36m----------------------------------------------------------------[0m
set /p "maininput=[95mMain Menu[0m:[92m-$[0m "
if "%maininput%"=="0" exit
if "%maininput%"=="1" goto pingcheck
if "%maininput%"=="2" goto organize
if "%maininput%"=="3" goto choice
if "%maininput%"=="4" goto passgen
if "%maininput%"=="5" goto minitweaks
if "%maininput%"=="6" goto wifipass
if "%maininput%"=="7" goto cleanup
if "%maininput%"=="8" goto main_get_admin
if /i "%maininput%"=="exit" goto exiter
goto main
:pingcheck
title Checking Connectivity
cls
echo [36m----------------------------------------------------------------[0m
echo [34m   _____           _       __         [0m      [33mMade By:[0m [34mcylvin[0m
echo [34m  / ___/__________(_)___  / /___  __  [0m[92mgithub.com/cyl-vin/Scripty[0m
echo [34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  [0m
echo [34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   [0m
echo [34m/____/\___/_/  /_/ .___/\__/\__, /    [0m
echo [34m                /_/        /____/[0m v1.0
echo [36m----------------------------------------------------------------[0m
echo Type a website URL or IP Address
echo below to check if you are connected to
echo the internet or that device IP
echo [36m----------------------------------------------------------------[0m
echo Type [36mleave[0m to go to the main menu
echo Type [31mexit[0m to close Scripty
echo [36m----------------------------------------------------------------[0m
set /p "webip=Website:[92m-$[0m "
if /i "%webip%"=="exit" goto exiter
if /i "%webip%"=="leave" goto main
ping !webip!
pause
goto pingcheck
:organize
cls
echo [36m----------------------------------------------------------------[0m
echo [34m   _____           _       __         [0m      [33mMade By:[0m [34mcylvin[0m
echo [34m  / ___/__________(_)___  / /___  __  [0m[92mgithub.com/cyl-vin/Scripty[0m
echo [34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  [0m
echo [34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   [0m
echo [34m/____/\___/_/  /_/ .___/\__/\__, /    [0m
echo [34m                /_/        /____/[0m v1.0
echo [36m----------------------------------------------------------------[0m
echo How would You like to Organize the files in this directory?
echo [36m----------------------------------------------------------------[0m
echo [33m1.)[0m Sort all files by extension into sperate folders
echo [33m2.)[0m Sort most files by type into seperate folders
echo (Option [33m2[0m combines options below into one command)
echo [36m----------------------------------------------------------------[0m
echo Type [96mvideo[0m to move video files into "Videos"
echo Type [96maudio[0m to move audio files into "Audio"
echo Type [96mimage[0m to move image files into "Images"
echo Type [96mtext[0m to move text-based files into "Documents"
echo Type [96mpresent[0m to move presentation files into "Presentation"
echo Type [96mexe[0m to move executable files into "Executables"
echo Type [96mdisc[0m to move Disc/Media files into "Disc_Images"
echo Type [96mzip[0m to move compressed file types into "Compressed_Files"
echo Type [36mLeave[0m and hit [32mENTER[0m to go to the Main Menu
echo Type [31mExit[0m and hit [32mENTER[0m to leave Scripty
echo [36m----------------------------------------------------------------[0m
set /p "organizer=[93mSort[0m:[92m-$[0m "
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
echo [36m----------------------------------------------------------------[0m
echo [34m   _____           _       __         [0m      [33mMade By:[0m [34mcylvin[0m
echo [34m  / ___/__________(_)___  / /___  __  [0m[92mgithub.com/cyl-vin/Scripty[0m
echo [34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  [0m
echo [34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   [0m
echo [34m/____/\___/_/  /_/ .___/\__/\__, /    [0m
echo [34m                /_/        /____/[0m v1.0
echo [36m----------------------------------------------------------------[0m
echo Rename file extensions (Finished)
echo [36m----------------------------------------------------------------[0m
echo [33m1.)[0m CHANGE File extensions
echo [33m2.)[0m REVERT to original File extensions
echo [33m3.)[0m Main Menu
echo [36m----------------------------------------------------------------[0m
set /p "rfe=[35mCommand[0m:[92m-$[0m "
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
echo [36m----------------------------------------------------------------[0m
echo [34m   _____           _       __         [0m      [33mMade By:[0m [34mcylvin[0m
echo [34m  / ___/__________(_)___  / /___  __  [0m[92mgithub.com/cyl-vin/Scripty[0m
echo [34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  [0m
echo [34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   [0m
echo [34m/____/\___/_/  /_/ .___/\__/\__, /    [0m
echo [34m                /_/        /____/[0m v1.0
echo [36m----------------------------------------------------------------[0m
echo Current Password Length: [35m%passlength%[0m
echo [36m----------------------------------------------------------------[0m
echo [33m1.)[0m Change the length of the password
echo [33m2.)[0m Generate the password
echo [33m3.)[0m Main Menu
echo [36m----------------------------------------------------------------[0m
echo [32mGenerated Password:[0m %passresult%
echo [36m----------------------------------------------------------------[0m
echo [1m[4mREMEMBER TO WRITE DOWN THE PASSWORD[0m
echo [36m----------------------------------------------------------------[0m
set /p "passgenerator=[93mPassword[0m:[92m-$[0m "
if "%passgenerator%"=="1" call :set_length
if "%passgenerator%"=="2" call :gen
if "%passgenerator%"=="3" goto main
if /i "%passgenerator%"=="exit" goto exiter
if /i "%passgenerator%"=="leave" goto main
goto passgen
:set_length
cls
echo [36m----------------------------------------------------------------[0m
echo [34m   _____           _       __         [0m      [33mMade By:[0m [34mcylvin[0m
echo [34m  / ___/__________(_)___  / /___  __  [0m[92mgithub.com/cyl-vin/Scripty[0m
echo [34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  [0m
echo [34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   [0m
echo [34m/____/\___/_/  /_/ .___/\__/\__, /    [0m
echo [34m                /_/        /____/[0m v1.0
echo [36m----------------------------------------------------------------[0m
echo Current Password Length: [35m%passlength%[0m
echo [36m----------------------------------------------------------------[0m
echo [33m1.)[0m Change the length of the password
echo [33m2.)[0m Generate the password
echo [33m3.)[0m Main Menu
echo [36m----------------------------------------------------------------[0m
echo [32mGenerated Password:[0m %passresult%
echo [36m----------------------------------------------------------------[0m
set /p "passlength=[91mEnter desired password length[0m:[92m-$[0m "
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
echo [36m----------------------------------------------------------------[0m
echo [34m   _____           _       __         [0m      [33mMade By:[0m [34mcylvin[0m
echo [34m  / ___/__________(_)___  / /___  __  [0m[92mgithub.com/cyl-vin/Scripty[0m
echo [34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  [0m
echo [34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   [0m
echo [34m/____/\___/_/  /_/ .___/\__/\__, /    [0m
echo [34m                /_/        /____/[0m v1.0
echo [36m----------------------------------------------------------------[0m
echo [93mIf changes don't take effect, launch Scripty as Administrator[0m
echo [93mor restart Windows Explorer using the option below[0m
echo [36m----------------------------------------------------------------[0m
echo [33m1.)[0m Disable Windows Transparency (may need to type "yes")
echo [33m2.)[0m Enable Windows Transparency (may need to type "yes")
echo [33m3.)[0m Disable Xbox Game Bar (may need to type "yes" twice)
echo [33m4.)[0m Enable Xbox Game Bar (may need to type "yes" twice)
echo [33m5.)[0m Add Ultimate Performance Profile
echo [33m6.)[0m Restart Windows Explorer
echo [33m7.)[0m Main menu
echo [33m8.)[0m Close and Exit Scripty
echo [36m----------------------------------------------------------------[0m
echo [1m[31mWARNING: SOME OF THESE OPTIONS CHANGE REGISTRY VALUES[0m
echo [36m----------------------------------------------------------------[0m
set /p "minortweaks=[90mTweak[0m:[92m-$[0m "
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
echo [36m----------------------------------------------------------------[0m
echo [34m   _____           _       __         [0m      [33mMade By:[0m [34mcylvin[0m
echo [34m  / ___/__________(_)___  / /___  __  [0m[92mgithub.com/cyl-vin/Scripty[0m
echo [34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  [0m
echo [34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   [0m
echo [34m/____/\___/_/  /_/ .___/\__/\__, /    [0m
echo [34m                /_/        /____/[0m v1.0
echo [36m----------------------------------------------------------------[0m
echo If the password isn't visible you must Use option [33m2[0m
echo [36m----------------------------------------------------------------[0m
echo [33m1.)[0m Show Saved Wireless Networks
echo [33m2.)[0m Give Scripty Admin Privileges (Relaunches Scripty)
echo [33m3.)[0m Main Menu
echo [36m----------------------------------------------------------------[0m
echo [32mENTER[0m the Network name below to view the password
echo [36m----------------------------------------------------------------[0m
set /p "passwifi=[32mNetwork[0m:[92m-$[0m "
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
echo [36m----------------------------------------------------------------[0m
echo [34m   _____           _       __         [0m      [33mMade By:[0m [34mcylvin[0m
echo [34m  / ___/__________(_)___  / /___  __  [0m[92mgithub.com/cyl-vin/Scripty[0m
echo [34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  [0m
echo [34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   [0m
echo [34m/____/\___/_/  /_/ .___/\__/\__, /    [0m
echo [34m                /_/        /____/[0m v1.0
echo [36m----------------------------------------------------------------[0m
echo Clean Temporary Files and Empty Recycle Bin
echo [36m----------------------------------------------------------------[0m
echo [33m1.)[0m Clean Temporary Files
echo [33m2.)[0m Empty Reycle Bin
echo [33m3.)[0m Combine options 1 and 2
echo [33m4.)[0m Main Menu
echo [36m----------------------------------------------------------------[0m
echo Select an option and press [32mENTER[0m
echo [36m----------------------------------------------------------------[0m
set /p "cleaning=[93mClean[0m:[92m-$[0m "
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
echo [36m----------------------------------------------------------------[0m
echo [34m   _____           _       __         [0m      [33mMade By:[0m [34mcylvin[0m
echo [34m  / ___/__________(_)___  / /___  __  [0m[92mgithub.com/cyl-vin/Scripty[0m
echo [34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  [0m
echo [34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   [0m
echo [34m/____/\___/_/  /_/ .___/\__/\__, /    [0m
echo [34m                /_/        /____/[0m v1.0
echo [36m----------------------------------------------------------------[0m
echo [33mAre you sure you want to[0m [31mLEAVE?[0m
echo [36m----------------------------------------------------------------[0m
echo Type [33mY[0m and press [32mENTER[0m for yes
echo Type [33mN[0m and press [32mENTER[0m for no
echo [36m----------------------------------------------------------------[0m
set /p "exiting=[31mExit?[0m:[92m-$[0m "
if /i "%exiting%"=="y" exit
if /i "%exiting%"=="n" goto main
echo No option was chosen. Returning.
pause
goto exiter
