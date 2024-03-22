@echo off
setlocal enabledelayedexpansion
for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a"
set "directory=%cd%"
:main
title Scripty coded by cylvin
mode con: cols=65 lines=28
cls
call :scripty_banner
echo Type the number of the option you want to choose and press %esc%[32mENTER%esc%[0m
call :seperator
echo %esc%[33m1.)%esc%[0m Check internet status
echo %esc%[33m2.)%esc%[0m Organize some files in this directory
echo %esc%[33m3.)%esc%[0m Change file extensions (Semi-Ransomeware Protection)
echo %esc%[33m4.)%esc%[0m Generate a password of any length (includes special chars.)
echo %esc%[33m5.)%esc%[0m MiniTweaks
echo %esc%[33m6.)%esc%[0m View Saved WiFi Passwords
echo %esc%[33m7.)%esc%[0m Remove Temporary files and empty Recycle Bin
echo %esc%[33m8.)%esc%[0m Give Scripty Admin Privileges (Relaunches Scripty w/ Admin)
echo %esc%[33m9.)%esc%[0m Timer and Stop Watch
echo %esc%[33m10.)%esc%[0m Get MD5 hash of all files in all subdirectories
echo %esc%[33m11.)%esc%[0m Set Timezone
echo %esc%[33m0.)%esc%[0m EXIT AND CLOSE SCRIPTY
call :seperator
echo Type %esc%[34mUpdate%esc%[0m to Update Scripty!
echo Type %esc%[91mExit%esc%[0m to close %esc%[34mScripty%esc%[0m from anywhere
echo Type %esc%[96mLeave%esc%[0m anywhere to come back to this menu
echo Type %esc%[33mCredits%esc%[0m to see the people that helped make this better
call :seperator
set /p "maininput=%esc%[95mMain Menu%esc%[0m:%esc%[92m-$%esc%[0m "
if "%maininput%"=="0" exit
if "%maininput%"=="1" goto pingcheck
if "%maininput%"=="2" goto organize
if "%maininput%"=="3" goto choice
if "%maininput%"=="4" goto passgen
if "%maininput%"=="5" goto minitweaks
if "%maininput%"=="6" goto wifipass
if "%maininput%"=="7" goto cleanup
if "%maininput%"=="8" goto main_get_admin
if "%maininput%"=="9" goto timing
if "%maininput%"=="10" goto hashy
if "%maininput%"=="11" goto date_time_setter
if /i "%maininput%"=="update" goto scripty_update
if /i "%maininput%"=="credits" goto credits
if /i "%maininput%"=="exit" goto exiter
goto main
:pingcheck
title Checking Connectivity
mode con: cols=65 lines=16
cls
call :scripty_banner
echo Type a website URL or IP Address
echo below to check if you are connected to
echo the internet or that device IP
call :seperator
echo Type %esc%[36mleave%esc%[0m to go to the main menu
echo Type %esc%[31mexit%esc%[0m to close Scripty
call :seperator
set /p "webip=Website:%esc%[92m-$%esc%[0m "
if /i "%webip%"=="exit" goto exiter
if /i "%webip%"=="leave" goto main
ping !webip!
pause
goto pingcheck
:organize
title File Organizer
mode con: cols=65 lines=29
cls
call :scripty_banner
echo How would You like to Organize the files in this directory?
call :seperator
echo %esc%[33m1.)%esc%[0m Sort all files by extension into sperate folders
echo %esc%[33m2.)%esc%[0m Sort most files by type into seperate folders
echo (Option %esc%[33m2%esc%[0m combines options below into one command)
call :seperator
echo Type %esc%[96mvideo%esc%[0m to move video files into "Videos"
echo Type %esc%[96maudio%esc%[0m to move audio files into "Audio"
echo Type %esc%[96mimage%esc%[0m to move image files into "Images"
echo Type %esc%[96mtext%esc%[0m to move text-based files into "Documents"
echo Type %esc%[96mpresent%esc%[0m to move presentation files into "Presentation"
echo Type %esc%[96mexe%esc%[0m to move executable files into "Executables"
echo Type %esc%[96mdisc%esc%[0m to move Disc/Media files into "Disc_Images"
echo Type %esc%[96mzip%esc%[0m to move compressed file types into "Compressed_Files"
echo Type %esc%[36mLeave%esc%[0m and hit %esc%[32mENTER%esc%[0m to go to the Main Menu
echo Type %esc%[31mExit%esc%[0m and hit %esc%[32mENTER%esc%[0m to leave Scripty
call :seperator
echo %esc%[33mCurrent Directory%esc%[0m: %esc%[96m!directory!%esc%[0m
echo Type %esc%[96mPath%esc%[0m to change the working directory
call :seperator
set /p "organizer=%esc%[93mSort%esc%[0m:%esc%[92m-$%esc%[0m "
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
if /i "%organizer%"=="path" goto change_path_organize
goto organize
:change_path_organize
title Enter directory you want to make changes in
mode con: cols=65 lines=12
cls
call :scripty_banner
echo Type the full path of the directory you wish to make changes
echo in below.(no quotations)
call :seperator
set /p "directory=%esc%[93mPath you want to make changes in%esc%[0m:%esc%[92m-$%esc%[0m "
if /i "%directory%"=="leave" goto main
if /i "%directory%"=="exit" goto exiter
goto organize
:video
cls
REM Get the current directory where the batch script is located
set "rootdir=!directory!"
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
set "rootdir=!directory!"
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
set "rootdir=!directory!"
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
set "rootdir=!directory!"
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
set "rootdir=!directory!"
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
set "rootdir=!directory!"
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
set "rootdir=!directory!"
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
set "rootdir=!directory!"
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
set "rootdir=!directory!"
REM Define file types and corresponding directories
set "fileTypes[0]=3g2 3gp avi flv h264 m4v mkv mov mp4 mpg mpeg rm swf vob webm wmv"
set "dirs[0]=Videos"
set "fileTypes[1]=aif cda mid midi mp3 mpa ogg wav wma wpl"
set "dirs[1]=Audio"
set "fileTypes[2]=ai jpg png bmp gif ico jpeg tif tiff ps psd svg webp"
set "dirs[2]=Images"
set "fileTypes[3]=txt rtf tex doc docx pdf odt aspx cer cfm csr html htm xls xlsx wpd"
set "dirs[3]=Documents"
set "fileTypes[4]=ppt pptx pps odp key"
set "dirs[4]=Presentation"
set "fileTypes[5]=apk cgi pl com exe gadget jar msi py wsf"
set "dirs[5]=Executables"
set "fileTypes[6]=bin dmg iso toast vcd"
set "dirs[6]=Disc_Images"
set "fileTypes[7]=7z arj deb pkg rar rpm tar.gz z zip"
set "dirs[7]=Compressed_Files"
REM Create necessary folders for sorting if they don't exist and move the files
for /L %%i in (0,1,7) do (
    2>nul mkdir "!rootdir!\!dirs[%%i]!"
    for %%F in (!fileTypes[%%i]!) do (
        move /Y "%rootdir%\*.%%F" "!rootdir!\!dirs[%%i]!" >nul 2>&1
    )
)
echo All files have been moved to their respective folders.
pause
goto organize
:extension
cls
REM Get the current directory where the batch script is located
set "rootdir=!directory!"
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
title Change File Extensions (Semi-Ransomeware Protection)
mode con: cols=65 lines=18
cls
call :scripty_banner
echo Rename file extensions (Semi-Ransomeware Protection)
call :seperator
echo %esc%[33m1.)%esc%[0m CHANGE File extensions
echo %esc%[33m2.)%esc%[0m REVERT to original File extensions
echo %esc%[33m3.)%esc%[0m Main Menu
call :seperator
echo %esc%[33mCurrent Directory%esc%[0m: %esc%[96m!directory!%esc%[0m
echo Type %esc%[96mPath%esc%[0m to change the working directory
call :seperator
set /p "rfe=%esc%[35mCommand%esc%[0m:%esc%[92m-$%esc%[0m "
if "%rfe%"=="1" goto safe
if "%rfe%"=="2" goto unsafe
if /i "%rfe%"=="exit" goto exiter
if "%rfe%"=="3" goto main
if /i "%rfe%"=="leave" goto main
if /i "%rfe%"=="path" goto change_path_choice
goto choice
:change_path_choice
title Enter directory you want to make changes in
mode con: cols=65 lines=12
cls
call :scripty_banner
echo Type the full path of the directory you wish to make changes
echo in below.(no quotations)
call :seperator
set /p "directory=%esc%[93mPath you want to make changes in%esc%[0m:%esc%[92m-$%esc%[0m "
if /i "%directory%"=="leave" goto main
if /i "%directory%"=="exit" goto exiter
goto choice
:safe
REM Rename all file extensions to new extensions
cd /d "%directory%"
set "origExtList=aif cda mid midi mp3 mpa ogg wav wma wpl 7z arj deb pkg rar rpm gz z zip bin dmg iso toast vcd csv dat db dbf log mdb sav sql tar xml email eml emlx msg oft ost pst vcf apk bin cgi pl com exe gadget jar msi py wsf fnt fon otf ttf ai bmp gif ico jpeg jpg png ps psd svg tif tiff webp asp aspx cer cfm css htm html js jsp part php rss xhtml key odp pps ppt pptx c class cpp cs h java sh swift vb ods xls xlsx xlsm bak cab cfg cpl cur dll dmp drv icns ini lnk sys tmp 3g2 3gp avi flv h264 m4v mkv mov mp4 mpg mpeg rm swf vob webm wmv doc docx odt pdf rtf tex txt wpd"
set "newExtList=196 341 1394 139413 1316d 13161 1577 23122 23131 231612 g26 11810 452 16117 18118 181613 726 26 26916 2914 4137 91915 201511920 2234 31922 4120 42 426 12157 1342 19122 191712 20118 241312 5131912 51312 5131224 13197 15620 151920 161920 2236 11611 2914 379 1612 31513 5245 7147520 10118 13199 1625 23196 61420 61514 15206 20206 19 21316 796 9315 101657 1057 16147 1619 16194 19227 2096 20966 235216 11916 1191624 3518 3613 31919 82013 8201312 1019 101916 1611820 16816 181919 248201312 11525 15416 161619 161620 16162024 3 31211919 31616 319 8 101221 198 19239620 222 15419 241219 24121924 24121913 2111 312 367 31612 32118 41212 41316 41822 931419 9149 121411 192519 201316 c7b c716 1229 61222 8bfd 13d22 131122 131522 1316d 13167 131657 1813 19236 22152 235213 231322 4153 415324 15420 1646 18206 20524 202420 23164"
set i=0
for %%a in (%origExtList%) do (
    set "origExt[!i!]=%%~a"
    set /a i+=1
)
set i=0
for %%a in (%newExtList%) do (
    set "newExt[!i!]=%%~a"
    set /a i+=1
)
for /r %%d in (.) do (
    pushd "%%~d"
    for /l %%i in (0,1,%i%) do (
        set "origExt=!origExt[%%i]!"
        set "newExt=!newExt[%%i]!"
        if defined origExt if defined newExt (
            ren "*.!origExt!" "*.!newExt!"
        )
    )
    popd
)
REM Optional: Display a message
echo All files have been renamed to a different extension.
pause
goto choice
:unsafe
REM Reinstate default File extensions
cd /d "%directory%"
set "origExtList=aif cda mid midi mp3 mpa ogg wav wma wpl 7z arj deb pkg rar rpm gz z zip bin dmg iso toast vcd csv dat db dbf log mdb sav sql tar xml email eml emlx msg oft ost pst vcf apk bin cgi pl com exe gadget jar msi py wsf fnt fon otf ttf ai bmp gif ico jpeg jpg png ps psd svg tif tiff webp asp aspx cer cfm css htm html js jsp part php rss xhtml key odp pps ppt pptx c class cpp cs h java sh swift vb ods xls xlsx xlsm bak cab cfg cpl cur dll dmp drv icns ini lnk sys tmp 3g2 3gp avi flv h264 m4v mkv mov mp4 mpg mpeg rm swf vob webm wmv doc docx odt pdf rtf tex txt wpd"
set "newExtList=196 341 1394 139413 1316d 13161 1577 23122 23131 231612 g26 11810 452 16117 18118 181613 726 26 26916 2914 4137 91915 201511920 2234 31922 4120 42 426 12157 1342 19122 191712 20118 241312 5131912 51312 5131224 13197 15620 151920 161920 2236 11611 2914 379 1612 31513 5245 7147520 10118 13199 1625 23196 61420 61514 15206 20206 19 21316 796 9315 101657 1057 16147 1619 16194 19227 2096 20966 235216 11916 1191624 3518 3613 31919 82013 8201312 1019 101916 1611820 16816 181919 248201312 11525 15416 161619 161620 16162024 3 31211919 31616 319 8 101221 198 19239620 222 15419 241219 24121924 24121913 2111 312 367 31612 32118 41212 41316 41822 931419 9149 121411 192519 201316 c7b c716 1229 61222 8bfd 13d22 131122 131522 1316d 13167 131657 1813 19236 22152 235213 231322 4153 415324 15420 1646 18206 20524 202420 23164"
set i=0
for %%a in (%origExtList%) do (
    set "origExt[!i!]=%%~a"
    set /a i+=1
)
set i=0
for %%a in (%newExtList%) do (
    set "newExt[!i!]=%%~a"
    set /a i+=1
)
for /r %%d in (.) do (
    pushd "%%~d"
    for /l %%i in (0,1,%i%) do (
        set "origExt=!origExt[%%i]!"
        set "newExt=!newExt[%%i]!"
        if defined newExt if defined origExt (
            ren "*.!newExt!" "*.!origExt!"
        )
    )
    popd
)
REM Optional: Display a message
echo All file extensions have been restored.
pause
goto choice
:passgen
mode con: cols=65 lines=19
title Generate a password with alphanumeric and special characters
cls
call :scripty_banner
echo Current Password Length: %esc%[35m%passlength%%esc%[0m
call :seperator
echo %esc%[33m1.)%esc%[0m Change the length of the password
echo %esc%[33m2.)%esc%[0m Generate the password
echo %esc%[33m3.)%esc%[0m Main Menu
call :seperator
echo %esc%[32mGenerated Password:%esc%[0m %passresult%
call :seperator
echo %esc%[1m%esc%[4mREMEMBER TO WRITE DOWN THE PASSWORD%esc%[0m
call :seperator
set /p "passgenerator=%esc%[93mPassword%esc%[0m:%esc%[92m-$%esc%[0m "
if "%passgenerator%"=="1" call :set_length
if "%passgenerator%"=="2" call :gen
if "%passgenerator%"=="3" goto main
if /i "%passgenerator%"=="exit" goto exiter
if /i "%passgenerator%"=="leave" goto main
goto passgen
:set_length
title Set the length of the password to be generated
mode con: cols=65 lines=17
cls
call :scripty_banner
echo Current Password Length: %esc%[35m%passlength%%esc%[0m
call :seperator
echo %esc%[33m1.)%esc%[0m Change the length of the password
echo %esc%[33m2.)%esc%[0m Generate the password
echo %esc%[33m3.)%esc%[0m Main Menu
call :seperator
echo %esc%[32mGenerated Password:%esc%[0m %passresult%
call :seperator
set /p "passlength=%esc%[91mEnter desired password length%esc%[0m:%esc%[92m-$%esc%[0m "
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
mode con: cols=65 lines=23
Title MiniTweaks
cls
call :scripty_banner
echo %esc%[93mIf changes don't take effect, launch Scripty as Administrator%esc%[0m
echo %esc%[93mor restart Windows Explorer using the option below%esc%[0m
call :seperator
echo %esc%[33m1.)%esc%[0m Disable Windows Transparency (may need to type "yes")
echo %esc%[33m2.)%esc%[0m Enable Windows Transparency (may need to type "yes")
echo %esc%[33m3.)%esc%[0m Disable Xbox Game Bar (may need to type "yes" twice)
echo %esc%[33m4.)%esc%[0m Enable Xbox Game Bar (may need to type "yes" twice)
echo %esc%[33m5.)%esc%[0m Add Ultimate Performance Profile
echo %esc%[33m6.)%esc%[0m Restart Windows Explorer
echo %esc%[33m7.)%esc%[0m Main menu
echo %esc%[33m8.)%esc%[0m Close and Exit Scripty
call :seperator
echo %esc%[1m%esc%[31mWARNING: SOME OF THESE OPTIONS CHANGE REGISTRY VALUES%esc%[0m
call :seperator
set /p "minortweaks=%esc%[90mTweak%esc%[0m:%esc%[92m-$%esc%[0m "
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
mode con: cols=65 lines=17
title View Saved WiFi Passwords
cls
call :scripty_banner
echo If the password isn't visible you must Use option %esc%[33m2%esc%[0m
call :seperator
echo %esc%[33m1.)%esc%[0m Show Saved Wireless Networks
echo %esc%[33m2.)%esc%[0m Give Scripty Admin Privileges (Relaunches Scripty)
echo %esc%[33m3.)%esc%[0m Main Menu
call :seperator
echo %esc%[32mENTER%esc%[0m the Network name below to view the password
call :seperator
set /p "passwifi=%esc%[32mNetwork%esc%[0m:%esc%[92m-$%esc%[0m "
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
title Cleanup
mode con: cols=65 lines=18
cls
call :scripty_banner
echo Clean Temporary Files and Empty Recycle Bin
call :seperator
echo %esc%[33m1.)%esc%[0m Clean Temporary Files
echo %esc%[33m2.)%esc%[0m Empty Reycle Bin
echo %esc%[33m3.)%esc%[0m Combine options 1 and 2
echo %esc%[33m4.)%esc%[0m Main Menu
call :seperator
echo Select an option and press %esc%[32mENTER%esc%[0m
call :seperator
set /p "cleaning=%esc%[93mClean%esc%[0m:%esc%[92m-$%esc%[0m "
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
:timing
mode con: cols=65 lines=13
cls
set /a "sec=0"
set /a "min=0"
set /a "hour=0"
set /a "days=0"
set /a "timer=60"
call :scripty_banner
echo %esc%[33m1.)%esc%[0m Stop Watch
echo %esc%[33m2.)%esc%[0m Timer
echo %esc%[33m3.)%esc%[0m Main Menu
call :seperator
set /p "time=%esc%[33mTiming%esc%[0m:%esc%[92m-$%esc%[0m "
if "%time%"=="1" goto stop_watch
if "%time%"=="2" goto countdown
if "%time%"=="3" goto main
if /i "%time%"=="leave" goto main
if /i "%time%"=="exit" goto exiter
goto timing
:stop_watch
mode con: cols=65 lines=11
title Scripty Stop Watch
cls
call :scripty_banner
set /a "sec+=1"
if "%sec%"=="60" set /a "min+=1" & set /a "sec=0"
if "%min%"=="60" set /a "hour+=1" & set /a "min=0" & set /a "sec=0"
if "%hour%"=="24" set /a "days+=1" & set /a "hour=0" & set /a "min=0" & set /a "sec=0"
echo Elapsed time: %days% days %hour% hours %min% minutes %sec% seconds
call :seperator
timeout /t 1 /nobreak >nul
goto stop_watch
:countdown
mode con: cols=65 lines=15
title Scripty Timer
cls
call :scripty_banner
echo %esc%[33m1.)%esc%[0m Set custom timer length(must be in seconds, i.e.7200=2 hours)
echo %esc%[33m2.)%esc%[0m Start the timer
echo %esc%[33m3.)%esc%[0m Main Menu
call :seperator
echo %esc%[39mCurrent Timer Length:%esc%[0m %timer% seconds
call :seperator
set /p "timermain=%esc%[31mTimer%esc%[0m:%esc%[92m-$%esc%[0m "
if "%timermain%"=="1" goto timer_length_set
if "%timermain%"=="2" goto countdown_real
if /i "%timermain%"=="leave" goto main
if /i "%timermain%"=="exit" goto exiter
goto countdown
:timer_length_set
mode con: cols=65 lines=11
title Set the timer length
cls
call :scripty_banner
echo How long would you like the timer to be? (In seconds)
call :seperator
set /p "timer=%esc%[31mTimer%esc%[0m:%esc%[92m-$%esc%[0m "
if /i "%timer%"=="leave" goto main
if /i "%timer%"=="exit" goto exiter
goto countdown
:countdown_real
mode con: cols=65 lines=11
title Scripty Countdown Timer
cls
call :scripty_banner
echo Countdown: %hour%:%min%:%sec%
call :seperator
set /a hour=%timer%/3600
set /a min=(%timer%%%3600)/60
set /a sec=%timer%%%60
if %hour% lss 10 set hr=0%hr%
if %min% lss 10 set min=0%min%
if %sec% lss 10 set sec=0%sec%
timeout /t 1 >nul
set /a timer-=1
if %timer% gtr 0 goto countdown_real
REM Play a sound
start "" "C:\Windows\Media\ring04.wav"
goto countdown
:hashy
mode con: cols=65 lines=17
title MD5 Hash Generator
cls
call :scripty_banner
echo Generate MD5 hashes of all files in a folder, and its subdirectories
call :seperator
echo %esc%[33m1.)%esc%[0m Generate the hashes (will be output to a text file)
echo %esc%[33m2.)%esc%[0m Change target directory
call :seperator
echo Current target directory: "%directory%"
call :seperator
set /p "hashing=%esc%[92mHash%esc%[0m: %esc%[92m-$%esc%[0m "
if "%hashing%"=="1" goto md5
if "%hashing%"=="2" goto change_path_hashy
if /i "%hashing%"=="leave" goto main
if /i "%hashing%"=="exit" goto exiter
goto hashy
:md5
cd /d "%directory%"
for /R %%f in (*) do (
    echo | set/p="%%f - "
    certutil -hashfile "%%f" MD5 | findstr /V ":"
) >> output.txt
pause
goto hashy
:change_path_hashy
title Enter directory you want to target
mode con: cols=65 lines=12
cls
call :scripty_banner
echo Type the full path of the directory you wish to make changes
echo in below.(no quotations)
call :seperator
set /p "directory=%esc%[93mPath you want to make changes in%esc%[0m:%esc%[92m-$%esc%[0m "
if /i "%directory%"=="leave" goto main
if /i "%directory%"=="exit" goto exiter
goto hashy
:date_time_setter
mode con: cols=65 lines=16
title Set your Timezone
cls
call :scripty_banner
echo Set/View Timezones
call :seperator
echo %esc%[33m1.)%esc%[0m View list of timezones (will run in new window)
echo %esc%[33m2.)%esc%[0m Main Menu
call :seperator
echo Just enter desired timezone below and hit enter to change it
call :seperator
set /p "settimezone=%esc%[36mTimeZone%esc%[0m:%esc%[92m-$%esc%[0m "
if "%settimezone%"=="1" start cmd /k "tzutil /l"
if "%settimezone%"=="2" goto main
if /i "%settimezone%"=="leave" goto main
if /i "%settimezone%"=="exit" goto exiter
tzutil /s "!settimezone!"
goto date_time_setter
:credits
mode con: cols=65 lines=14
title Scripty Credits
cls
call :scripty_banner
echo %esc%[33mHuge Thank You to everyone that contributed to this project:%esc%[0m
call :seperator
echo %esc%[34mcylvin%esc%[0m and my github link: %esc%[92mgithub.com/cyl-vin%esc%[0m
echo %esc%[91mamakvana%esc%[0m and their github link: %esc%[92mhttps://github.com/amakvana%esc%[0m
pause
goto main
:exiter
title Close and exit Scripty?
mode con: cols=65 lines=14
cls
call :scripty_banner
echo %esc%[33mAre you sure you want to%esc%[0m %esc%[31mLEAVE?%esc%[0m
call :seperator
echo Type %esc%[33mY%esc%[0m and press %esc%[32mENTER%esc%[0m for yes
echo Type %esc%[33mN%esc%[0m and press %esc%[32mENTER%esc%[0m for no
call :seperator
set /p "exiting=%esc%[31mExit?%esc%[0m:%esc%[92m-$%esc%[0m "
if /i "%exiting%"=="y" exit
if /i "%exiting%"=="n" goto main
echo No option was chosen. Returning.
pause
goto exiter
:scripty_update
title Scripty Updater
cls
if /i not "%~1"=="updated" (
    echo Updating %~nx0 ...
    >nul 2>&1 powershell iwr "https://raw.githubusercontent.com/cyl-vin/Scripty/main/scripty.bat" -OutFile "%temp%\%~nx0"
    >nul 2>&1 move /y "%temp%\%~nx0" "%~dpnx0"
    >nul 2>&1 powershell start "%~0" updated & exit /b
)
cd /d "%~dp0"
goto main
:seperator
echo %esc%[36m----------------------------------------------------------------%esc%[0m
exit /b
:scripty_banner
echo %esc%[36m----------------------------------------------------------------%esc%[0m
echo %esc%[34m   _____           _       __         %esc%[0m      %esc%[33mMade By:%esc%[0m %esc%[34mcylvin%esc%[0m
echo %esc%[34m  / ___/__________(_)___  / /___  __  %esc%[0m%esc%[92mgithub.com/cyl-vin/Scripty%esc%[0m
echo %esc%[34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  %esc%[0m
echo %esc%[34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   %esc%[0m
echo %esc%[34m/____/\___/_/  /_/ .___/\__/\__, /    %esc%[0m
echo %esc%[34m                /_/        /____/%esc%[0m v1.8
echo %esc%[36m----------------------------------------------------------------%esc%[0m
exit /b
