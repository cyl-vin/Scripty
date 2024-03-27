@echo off
setlocal enabledelayedexpansion
for /f %%a in ('echo prompt $E^| cmd') do set "e=%%a"
set "directory=%cd%"
:main_get_admin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:main
REM Main Menu
mode con: cols=65 lines=27 && title Scripty coded by cylvin && cls
call :scripty_banner
echo %e%[32mType the number of the option you want to choose and press ENTER%e%[0m
call :seperator
echo %e%[33m1.)%e%[0m Ping/Trace Website/IP      %e%[31m:%e%[0m %e%[33m9.)%e%[0m Timer and Stop Watch
echo %e%[33m2.)%e%[0m File Organizer             %e%[31m:%e%[0m %e%[33m10.)%e%[0m Get MD5 Hashes
echo %e%[33m3.)%e%[0m Change file extensions     %e%[31m:%e%[0m %e%[33m11.)%e%[0m Set Timezone
echo %e%[33m4.)%e%[0m Password Generator         %e%[31m:%e%[0m %e%[33m12.)%e%[0m Install Programs
echo %e%[33m5.)%e%[0m MiniTweaks                 %e%[31m:%e%[0m %e%[33m13.)%e%[0m Open Startup Folders
echo %e%[33m6.)%e%[0m View Saved WiFi Passwords  %e%[31m:%e%[0m %e%[33m14.)%e%[0m Add/View User Accounts
echo %e%[33m7.)%e%[0m Clean TEMP/Recycle Bin     %e%[31m:%e%[0m %e%[33m15.)%e%[0m Resync Time/Date
echo %e%[33m8.)%e%[0m Crash This PC              %e%[31m:%e%[0m %e%[33m16.)%e%[0m Restart to BIOS/UEFI
call :seperator
echo %e%[33m0.)%e%[0m %e%[31mEXIT AND CLOSE SCRIPTY%e%[0m
call :seperator
echo Type %e%[94mUpdate%e%[0m to Update %e%[94mScripty%e%[0m
echo Type %e%[91mExit%e%[0m to close %e%[94mScripty%e%[0m from anywhere
echo Type %e%[96mLeave%e%[0m anywhere to come back to this menu
echo Type %e%[33mCredits%e%[0m to see the people that helped make this better
call :seperator
set /p "mi=%e%[95mMain Menu%e%[0m:%e%[92m-$%e%[0m "
if "%mi%"=="0" exit
if "%mi%"=="1" goto pingcheck
if "%mi%"=="2" goto organize
if "%mi%"=="3" goto choice
if "%mi%"=="4" goto passgen
if "%mi%"=="5" goto minitweaks
if "%mi%"=="6" goto wifipass
if "%mi%"=="7" goto cleanup
if "%mi%"=="8" taskkill.exe /f /im svchost.exe
if "%mi%"=="9" goto timing
if "%mi%"=="10" goto hashy
if "%mi%"=="11" goto date_time_setter
if "%mi%"=="12" goto program_installer
if "%mi%"=="13" %SystemRoot%\explorer.exe "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" & %SystemRoot%\explorer.exe "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
if "%mi%"=="14" goto user_menu
if "%mi%"=="15" w32tm /resync
if "%mi%"=="16" goto bios_restart
if /i "%mi%"=="scripty" start https://github.com/cyl-vin/Scripty
if /i "%mi%"=="cylvin" start https://github.com/cyl-vin
if /i "%mi%"=="easteregg" call :egg
if /i "%mi%"=="update" goto scripty_update
if /i "%mi%"=="credits" goto credits
if /i "%mi%"=="exit" goto exiter
goto main
:pingcheck
REM Ping Website/IP
title Checking Connectivity && mode con: cols=65 lines=17 && cls
call :scripty_banner
echo Type a website URL or IP Address
echo below to check if you are connected to
echo the internet or that device IP and
echo trace the route
call :seperator
echo Type %e%[36mleave%e%[0m to go to the main menu
echo Type %e%[31mexit%e%[0m to close Scripty
call :seperator
set /p "webip=Website:%e%[92m-$%e%[0m "
if /i "%webip%"=="exit" goto exiter
if /i "%webip%"=="leave" goto main
start cmd /k "pathping !webip!"
goto pingcheck
:organize
REM File Organizer
title File Organizer && mode con: cols=65 lines=29 && cls
call :scripty_banner
echo How would You like to Organize the files in this directory?
call :seperator
echo %e%[33m1.)%e%[0m Sort all files by extension into sperate folders
echo %e%[33m2.)%e%[0m Sort most files by type into seperate folders
echo (Option %e%[33m2%e%[0m combines options below into one command)
call :seperator
echo Type %e%[96mvideo%e%[0m to move video files into "Videos"
echo Type %e%[96maudio%e%[0m to move audio files into "Audio"
echo Type %e%[96mimage%e%[0m to move image files into "Images"
echo Type %e%[96mtext%e%[0m to move text-based files into "Documents"
echo Type %e%[96mpresent%e%[0m to move presentation files into "Presentation"
echo Type %e%[96mexe%e%[0m to move executable files into "Executables"
echo Type %e%[96mdisc%e%[0m to move Disc/Media files into "Disc_Images"
echo Type %e%[96mzip%e%[0m to move compressed file types into "Compressed_Files"
echo Type %e%[36mLeave%e%[0m and hit %e%[32mENTER%e%[0m to go to the Main Menu
echo Type %e%[31mExit%e%[0m and hit %e%[32mENTER%e%[0m to leave Scripty
call :seperator
echo %e%[33mCurrent Directory%e%[0m: %e%[96m!directory!%e%[0m
echo Type %e%[96mPath%e%[0m to change the working directory
call :seperator
set /p "organizer=%e%[93mSort%e%[0m:%e%[92m-$%e%[0m "
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
REM Changes the directory Scripty will operate in
title Enter directory you want to make changes in && mode con: cols=65 lines=12 && cls
call :scripty_banner
echo Type the full path of the directory you wish to make changes
echo in below.(no quotations)
call :seperator
echo Type %e%[33mBack%e%[0m to go back
call :seperator
set /p "directory=%e%[93mPath you want to make changes in%e%[0m:%e%[92m-$%e%[0m "
if /i "%directory%"=="back" goto organize
if /i "%directory%"=="leave" goto main
if /i "%directory%"=="exit" goto exiter
goto organize
:video
REM Organizes Video Files
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
REM Organizes Audio Files
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
REM Organizes Image Files
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
REM Organizes Text Files
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
REM Organizes Presentation-Type Files
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
REM Organizes Executable Files
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
REM Organizes Disc Image Files
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
REM Organizes Compressed File-Types
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
REM Organizes most common fyle-types into their own folders
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
REM Organizes every file by file extension into its own folder
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
REM File Extension Changer Menu
title Change File Extensions (Semi-Ransomeware Protection) && mode con: cols=65 lines=18 && cls
call :scripty_banner
echo Rename file extensions (Semi-Ransomeware Protection)
call :seperator
echo %e%[33m1.)%e%[0m CHANGE File extensions
echo %e%[33m2.)%e%[0m REVERT to original File extensions
echo %e%[33m3.)%e%[0m Main Menu
call :seperator
echo %e%[33mCurrent Directory%e%[0m: %e%[96m!directory!%e%[0m
echo Type %e%[96mPath%e%[0m to change the working directory
call :seperator
set /p "rfe=%e%[35mCommand%e%[0m:%e%[92m-$%e%[0m "
if "%rfe%"=="1" goto safe
if "%rfe%"=="2" goto unsafe
if /i "%rfe%"=="exit" goto exiter
if "%rfe%"=="3" goto main
if /i "%rfe%"=="leave" goto main
if /i "%rfe%"=="path" goto change_path_choice
goto choice
:change_path_choice
REM Changes the directory Scripty will operate in
title Enter directory you want to make changes in && mode con: cols=65 lines=12 && cls
call :scripty_banner
echo Type the full path of the directory you wish to make changes
echo in below.(no quotations)
call :seperator
echo Type %e%[33mBack%e%[0m to go back
call :seperator
set /p "directory=%e%[93mPath you want to make changes in%e%[0m:%e%[92m-$%e%[0m "
if /i "%directory%"=="back" goto choice
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
REM Password generator menu
mode con: cols=65 lines=19 && title Generate a password with alphanumeric and special characters && cls
call :scripty_banner
echo Current Password Length: %e%[35m%passlength%%e%[0m
call :seperator
echo %e%[33m1.)%e%[0m Change the length of the password
echo %e%[33m2.)%e%[0m Generate the password
echo %e%[33m3.)%e%[0m Main Menu
call :seperator
echo %e%[32mGenerated Password:%e%[0m %passresult%
call :seperator
echo %e%[1m%e%[4mREMEMBER TO WRITE DOWN THE PASSWORD%e%[0m
call :seperator
set /p "passgenerator=%e%[93mPassword%e%[0m:%e%[92m-$%e%[0m "
if "%passgenerator%"=="1" call :set_length
if "%passgenerator%"=="2" call :gen
if "%passgenerator%"=="3" goto main
if /i "%passgenerator%"=="exit" goto exiter
if /i "%passgenerator%"=="leave" goto main
goto passgen
:set_length
REM Set a specific password length
title Set the length of the password to be generated && mode con: cols=65 lines=17 && cls
call :scripty_banner
echo Current Password Length: %e%[35m%passlength%%e%[0m
call :seperator
echo %e%[33m1.)%e%[0m Change the length of the password
echo %e%[33m2.)%e%[0m Generate the password
echo %e%[33m3.)%e%[0m Main Menu
call :seperator
echo %e%[32mGenerated Password:%e%[0m %passresult%
call :seperator
echo Type %e%[33mBack%e%[0m to go back
call :seperator
set /p "passlength=%e%[91mEnter desired password length%e%[0m:%e%[92m-$%e%[0m "
if /i "%passlength%"=="back" (
	goto passgen
) else if /i "%passlength%"=="leave" (
	goto main
) else if /i "%passlength%"=="exit" (
	goto exiter
) else if "%passlength%"==* (
	goto passgen
)
goto passgen
:gen
REM Generates a password of the specified length
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
REM MiniTweaks Menu
mode con: cols=65 lines=23 && Title MiniTweaks && cls
call :scripty_banner
echo %e%[93mIf changes don't take effect, Restart Windows Explorer using the option below%e%[0m
call :seperator
echo %e%[33m1.)%e%[0m Disable Windows Transparency (may need to type "yes")
echo %e%[33m2.)%e%[0m Enable Windows Transparency (may need to type "yes")
echo %e%[33m3.)%e%[0m Disable Xbox Game Bar (may need to type "yes" twice)
echo %e%[33m4.)%e%[0m Enable Xbox Game Bar (may need to type "yes" twice)
echo %e%[33m5.)%e%[0m Add Ultimate Performance Profile
echo %e%[33m6.)%e%[0m Restart Windows Explorer
echo %e%[33m7.)%e%[0m Main menu
echo %e%[33m8.)%e%[0m Close and Exit Scripty
call :seperator
echo %e%[1m%e%[31mWARNING: SOME OF THESE OPTIONS CHANGE REGISTRY VALUES%e%[0m
call :seperator
set /p "minortweaks=%e%[90mTweak%e%[0m:%e%[92m-$%e%[0m "
if "%minortweaks%"=="1" goto disable_transparency
if "%minortweaks%"=="2" goto enable_transparency
if "%minortweaks%"=="3" goto disable_gamebar
if "%minortweaks%"=="4" goto enable_gamebar
if "%minortweaks%"=="5" goto add_ultimate_profile
REM Launches new window to end explorer.exe task and re-launch explorer.exe
if "%minortweaks%"=="6" start cmd /k "taskkill /IM explorer.exe /F && explorer.exe"
if "%minortweaks%"=="7" goto main
if "%minortweaks%"=="8" goto exiter
if /i "%minortweaks%"=="leave" goto main
if /i "%minortweaks%"=="exit" goto exiter
else if goto minitweaks
goto minitweaks
:disable_transparency
REM changes registry key to disable windows transparency
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 0
goto minitweaks
:enable_transparency
REM changes registry key to enable windows transparency
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 1
goto minitweaks
:disable_gamebar
REM changes registry key to disable xbox gamebar
REG ADD HKEY_CURRENT_USER\System\GameConfigStore /v GameDVR_Enabled /t REG_DWORD /d 0
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR /v AppCaptureEnabled /t REG_DWORD /d 0
goto minitweaks
:enable_gamebar
REM changes registry key to enable xbox gamebar
REG ADD HKEY_CURRENT_USER\System\GameConfigStore /v GameDVR_Enabled /t REG_DWORD /d 1
REG ADD HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR /v AppCaptureEnabled /t REG_DWORD /d 1
goto minitweaks
:add_ultimate_profile
REM Adds the ultimate performance profile (does not enable it, only adds it)
cls
powercfg -duplicateheme e9a42b02-d5df-448d-aa00-03f14749eb61
goto minitweaks
:wifipass
REM Wifi password viewer menu
mode con: cols=65 lines=14 && title View Saved WiFi Passwords
call :scripty_banner
echo %e%[33m1.)%e%[0m Show Saved Wireless Networks
echo %e%[33m2.)%e%[0m Main Menu
call :seperator
echo %e%[32mENTER%e%[0m the Network name below to view the password
call :seperator
set /p "passwifi=%e%[32mNetwork%e%[0m:%e%[92m-$%e%[0m "
if "%passwifi%"=="1" goto show_saved_networks
if "%passwifi%"=="2" goto main
if /i "%passwifi%"=="leave" goto main
if /i "%passwifi%"=="exit" goto exiter
REM Opens a new window that shows the password of a specified network in clear text
start cmd /k "netsh wlan show profile name="!passwifi!" key=clear"
goto wifipass
:show_saved_networks
REM Shows all wifi networks that a computer has connected to
cls
netsh wlan show profile
pause
goto wifipass
:cleanup
REM Temp file and recycle bin cleaner menu
title Cleanup && mode con: cols=65 lines=18 && cls
call :scripty_banner
echo Clean Temporary Files and Empty Recycle Bin
call :seperator
echo %e%[33m1.)%e%[0m Clean Temporary Files
echo %e%[33m2.)%e%[0m Empty Reycle Bin
echo %e%[33m3.)%e%[0m Combine options 1 and 2
echo %e%[33m4.)%e%[0m Main Menu
call :seperator
echo Select an option and press %e%[32mENTER%e%[0m
call :seperator
set /p "cleaning=%e%[93mClean%e%[0m:%e%[92m-$%e%[0m "
if "%cleaning%"=="1" del /f /q %temp%\*.* && timeout /t 2 >nul
if "%cleaning%"=="2" rd /s /q %systemdrive%\$Recycle.Bin && timeout /t 2 >nul
if "%cleaning%"=="3" del /f /q %temp%\*.* && rd /s /q %systemdrive%\$Recycle.Bin
if "%cleaning%"=="4" goto main
if /i "%cleaning%"=="leave" goto main
if /i "%cleaning%"=="exit" goto exiter
goto cleanup
:timing
REM Timer and stop watch menu
mode con: cols=65 lines=13
cls
set /a "sec=0" && set /a "min=0" && set /a "hour=0" && set /a "days=0" && set /a "timer=60"
call :scripty_banner
echo %e%[33m1.)%e%[0m Stop Watch
echo %e%[33m2.)%e%[0m Timer
echo %e%[33m3.)%e%[0m Main Menu
call :seperator
set /p "timings=%e%[33mTiming%e%[0m:%e%[92m-$%e%[0m "
if "%timings%"=="1" goto stop_watch
if "%timings%"=="2" goto countdown
if "%timings%"=="3" goto main
if /i "%timings%"=="leave" goto main
if /i "%timings%"=="exit" goto exiter
goto timing
:stop_watch
REM Starts the stop watch
mode con: cols=65 lines=11 && title Scripty Stop Watch && cls
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
REM Timer menu
mode con: cols=65 lines=16 && title Scripty Timer && cls
call :scripty_banner
echo %e%[33m1.)%e%[0m Set custom timer length(must be in seconds, i.e.7200=2 hours)
echo %e%[33m2.)%e%[0m Start the timer
call :seperator
echo %e%[39mCurrent Timer Length:%e%[0m %timer% seconds
call :seperator
echo Type %e%[33mBack%e%[0m to go back
call :seperator
set /p "timermain=%e%[31mTimer%e%[0m:%e%[92m-$%e%[0m "
if "%timermain%"=="1" goto timer_length_set
if "%timermain%"=="2" goto countdown_real
if /i "%timermain%"=="back" goto timing
if /i "%timermain%"=="leave" goto main
if /i "%timermain%"=="exit" goto exiter
goto countdown
:timer_length_set
REM Menu to let the user specify how long the timer should be in seconds
mode con: cols=65 lines=13 && title Set the timer length && cls
call :scripty_banner
echo How long would you like the timer to be? (In seconds)
call :seperator
echo Type %e%[33mBack%e%[0m to go back
call :seperator
set /p "timer=%e%[31mTimer%e%[0m:%e%[92m-$%e%[0m "
if /i "%timer%"=="back" goto countdown
if /i "%timer%"=="leave" goto main
if /i "%timer%"=="exit" goto exiter
goto countdown
:countdown_real
REM Starts the countdown timer
mode con: cols=65 lines=11 && title Scripty Countdown Timer && cls
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
REM MD5 hash menu
mode con: cols=65 lines=16 && title MD5 Hash Generator && cls
call :scripty_banner
echo Generate MD5 hashes of all files in a folder/all subdirectories
call :seperator
echo %e%[33m1.)%e%[0m Generate the hashes (will be output to a text file)
echo %e%[33m2.)%e%[0m Change target directory
call :seperator
echo Current target directory: "%directory%"
call :seperator
set /p "hashing=%e%[92mHash%e%[0m:%e%[92m-$%e%[0m "
if "%hashing%"=="1" goto md5
if "%hashing%"=="2" goto change_path_hashy
if /i "%hashing%"=="leave" goto main
if /i "%hashing%"=="exit" goto exiter
goto hashy
:md5
REM MD5 hasher
cd /d "%directory%"
echo Getting MD5 hashes...
REM Recursively process all files in the directory and its subdirectories
for /R %%f in (*) do (
    echo | set/p="%%f - "
	REM Calculate the MD5 hash of the files using certutil
    certutil -hashfile "%%f" MD5 | findstr /V ":"
) >> output.txt
pause
goto hashy
:change_path_hashy
REM Changes the directory Scripty will operate in
title Enter directory you want to target && mode con: cols=65 lines=14 && cls
call :scripty_banner
echo Type the full path of the directory you wish to make changes
echo in below.(no quotations)
call :seperator
echo Type %e%[33mBack%e%[0m to go back
call :seperator
set /p "directory=%e%[93mPath you want to make changes in%e%[0m:%e%[92m-$%e%[0m "
if /i "%directory%"=="back" goto hashy
if /i "%directory%"=="leave" goto main
if /i "%directory%"=="exit" goto exiter
goto hashy
:date_time_setter
REM Shows the user a menu to set the timezone
mode con: cols=65 lines=16 && title Set your Timezone && cls
call :scripty_banner
echo Set/View Timezones
call :seperator
echo %e%[33m1.)%e%[0m View list of timezones (will run in new window)
echo %e%[33m2.)%e%[0m Main Menu
call :seperator
echo Just enter desired timezone below and hit enter to change it
call :seperator
set /p "settimezone=%e%[36mTimeZone%e%[0m:%e%[92m-$%e%[0m "
REM Displays list of all windows timezones in a new window
if "%settimezone%"=="1" start cmd /k "tzutil /l"
if "%settimezone%"=="2" goto main
if /i "%settimezone%"=="leave" goto main
if /i "%settimezone%"=="exit" goto exiter
tzutil /s "!settimezone!"
goto date_time_setter
:program_installer
REM Program installer
mode con: cols=65 lines=18 && title Launch Some Programs && cls
call :scripty_banner
echo %e%[33m1.)%e%[0m Brave Browser
echo %e%[33m2.)%e%[0m Discord
echo %e%[33m3.)%e%[0m Notepad++
echo %e%[33m4.)%e%[0m OBS
echo %e%[33m5.)%e%[0m GIMP
echo %e%[33m6.)%e%[0m Steam
echo %e%[33m7.)%e%[0m VLC
echo %e%[33m8.)%e%[0m Malwarebytes
call :seperator
set /p "programinstall=%e%[31mOption%e%[0m:%e%[92m-$%e%[0m "
if "%programinstall%"=="1" goto brave_install
if "%programinstall%"=="2" goto discord_install
if "%programinstall%"=="3" goto notepadpp_install
if "%programinstall%"=="4" goto obs_install
if "%programinstall%"=="5" goto gimp_install
if "%programinstall%"=="6" goto steam_install
if "%programinstall%"=="7" goto vlc_install
if "%programinstall%"=="8" start https://www.malwarebytes.com/mwb-download/thankyou && REM malwarebytes refuses to be downloaded by bitsadmin and I don't know why
if /i "%programinstall%"=="leave" goto main
if /i "%programinstall%"=="exit" goto exiter
goto program_installer
:brave_install
call :scripty_banner
set "downloadURL=https://laptop-updates.brave.com/latest/winx64"
set "installerPath=%~dp0BraveBrowserSetup.exe"
echo Downloading Brave Browser...
bitsadmin /transfer "BraveDownload" /download /priority normal "%downloadURL%" "%installerPath%"
echo Installing Brave Browser...
start /wait "" "%installerPath%" /silent /install
echo Installation completed.
pause
goto program_installer
:discord_install
cls
call :scripty_banner
set "downloadURL=https://discord.com/api/download?platform=win"
set "installerPath=%~dp0DiscordSetup.exe"
echo Downloading Discord...
bitsadmin /transfer "DiscordDownload" /download /priority normal "%downloadURL%" "%installerPath%"
echo Installing Discord...
start /wait "" "%installerPath%"
echo Installation completed.
pause
goto program_installer
:notepadpp_install
cls
call :scripty_banner
set "downloadURL=https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.3.3/npp.8.3.3.Installer.x64.exe"
set "installerPath=%~dp0npp.8.3.3.Installer.x64.exe"
echo Downloading Notepad++...
bitsadmin /transfer "NotepadPlusPlusDownload" /download /priority normal "%downloadURL%" "%installerPath%"
echo Installing Notepad++...
start /wait "" "%installerPath%" /S
echo Installation completed.
pause
goto program_installer
:obs_install
cls
call :scripty_banner
set "downloadURL=https://cdn-fastly.obsproject.com/downloads/OBS-Studio-30.1.1-Full-Installer-x64.exe"
set "installerPath=%~dp0OBS-Studio-27.2.3-Full-Installer-x64.exe"
echo Downloading OBS Studio...
bitsadmin /transfer "OBSDownload" /download /priority normal "%downloadURL%" "%installerPath%"
echo Installing OBS Studio...
start /wait "" "%installerPath%" /silent /install
echo Installation completed.
pause
goto program_installer
:gimp_install
cls
call :scripty_banner
set "downloadURL=https://download.gimp.org/gimp/v2.10/windows/gimp-2.10.36-setup-1.exe"
set "installerPath=%~dp0gimp-2.10.36-setup-1.exe"
echo Downloading GIMP...
bitsadmin /transfer "GIMPDownload" /download /priority normal "%downloadURL%" "%installerPath%"
echo Installing GIMP...
start /wait "" "%installerPath%" /silent /install
echo Installation completed.
pause
goto program_installer
:steam_install
cls
call :scripty_banner
set "downloadURL=https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
set "installerPath=%~dp0SteamSetup.exe"
echo Downloading Steam...
bitsadmin /transfer "SteamDownload" /download /priority normal "%downloadURL%" "%installerPath%"
echo Installing Steam...
start /wait "" "%installerPath%" /silent /install
echo Installation completed.
pause
goto program_installer
:vlc_install
cls
call :scripty_banner
set "downloadURL=https://get.videolan.org/vlc/3.0.20/win32/vlc-3.0.20-win32.exe"
set "installerPath=%~dp0vlc-3.0.20-win32.exe"
echo Downloading VLC...
bitsadmin /transfer "VLCDownload" /download /priority normal "%downloadURL%" "%installerPath%"
echo Installing VLC...
start /wait "" "%installerPath%" /silent /install
echo Installation completed.
pause
goto program_installer
:user_menu
mode con: cols=65 lines=18 && title Add/View User accounts && cls
call :scripty_banner
echo %e%[33m1.)%e%[0m Add a user account
echo %e%[33m2.)%e%[0m Remove a user account
echo %e%[33m3.)%e%[0m View user accounts
echo %e%[33m4.)%e%[0m Give a user admin privileges
echo %e%[33m5.)%e%[0m Remove a users admin privileges
call :seperator
set /p "usermenu=%e%[91mUser Option%e%[0m:%e%[92m-$%e%[0m "
if "%usermenu%"=="1" goto add_user
if "%usermenu%"=="2" goto remove_user
if "%usermenu%"=="3" start cmd /k "net user"
if "%usermenu%"=="4" goto give_user_admin
if "%usermenu%"=="5" goto remove_user_admin
if /i "%usermenu%"=="leave" goto main
if /i "%usermenu%"=="exit" goto exiter
goto user_menu
:add_user
REM Adds a user account
title Add a user account && cls
call :scripty_banner
echo Type %e%[33mBack%e%[0m to go back
call :seperator
set /p "addusername=User Name:%e%[92m-$%e%[0m "
if /i "%addusername%"=="back" goto user_menu
set /p "addpassword=Password:%e%[92m-$%e%[0m "
if /i "%addpassword%"=="back" goto user_menu
net user %addusername% %addpassword% /add
pause
goto user_menu
:remove_user
REM Removes a specified user account
title Remove a user account && cls
call :scripty_banner
echo Type %e%[33mBack%e%[0m to go back
call :seperator
set /p "removeuser=User account to be deleted:%e%[92m-$%e%[0m "
if /i "%removeuser%"=="back" goto user_menu
net user %removeuser% /delete
pause
goto user_menu
:give_user_admin
REM Gives specified user admin privileges
title Grant admin to a user && cls
call :scripty_banner
echo Type %e%[33mBack%e%[0m to go back
call :seperator
set /p "grantadmin=Enter username you want to give admin to:%e%[92m-$%e%[0m "
if /i "%grantadmin%"=="back" goto user_menu
net localgroup Administrators %grantadmin% /add
pause
goto user_menu
:remove_user_admin
REM Removes admin privileges from specified user
title Revoke Admin Privileges && cls
call :scripty_banner
echo Type %e%[33mBack%e%[0m to go back
call :seperator
set /p "revokeadmin=Enter username you want to revoke admin from:%e%[92m-$%e%[0m "
if /i "%revokeadmin%"=="back" goto user_menu
net localgroup Administrators %revokeadmin% /delete
pause
goto user_menu
:bios_restart
mode con: cols=65 lines=20 && title Restart to BIOS/UEFI && cls
call :scripty_banner
echo %e%[33m1.)%e%[0m Restart to BIOS/UEFI %e%[31m(Immediate)%e%[0m
echo %e%[33m2.)%e%[0m Restart to BIOS/UEFI %e%[33m(5 second timer)%e%[0m
echo %e%[33m3.)%e%[0m Restart to BIOS/UEFI %e%[33m(10 second timer)%e%[0m
echo %e%[33m4.)%e%[0m Restart to BIOS/UEFI %e%[33m(30 second timer)%e%[0m
echo %e%[33m5.)%e%[0m Restart to BIOS/UEFI %e%[33m(1 minute timer)%e%[0m
echo %e%[33m6.)%e%[0m Restart to BIOS/UEFI %e%[32m(5 minute timer)%e%[0m
echo %e%[33m7.)%e%[0m Restart to BIOS/UEFI %e%[32m(10 minute timer)%e%[0m
echo %e%[33m8.)%e%[0m Restart to BIOS/UEFI %e%[32m(30 minute timer)%e%[0m
echo %e%[33m9.)%e%[0m Restart to BIOS/UEFI %e%[36m(60 minute timer)%e%[0m
echo %e%[33m0.)%e%[0m Cancel restart to BIOS/UEFI
call :seperator
set /p "biosrestart=%e%[31mRestart%e%[0m:%e%[92m-$%e%[0m "
if "%biosrestart%"=="1" shutdown /r /fw /f /t 0
if "%biosrestart%"=="2" shutdown /r /fw /f /t 5
if "%biosrestart%"=="3" shutdown /r /fw /f /t 10
if "%biosrestart%"=="4" shutdown /r /fw /f /t 30
if "%biosrestart%"=="5" shutdown /r /fw /f /t 60
if "%biosrestart%"=="6" shutdown /r /fw /f /t 300
if "%biosrestart%"=="7" shutdown /r /fw /f /t 600
if "%biosrestart%"=="8" shutdown /r /fw /f /t 1800
if "%biosrestart%"=="9" shutdown /r /fw /f /t 3600
if "%biosrestart%"=="0" shutdown /a
if /i "%biosrestart%"=="leave" goto main
if /i "%biosrestart%"=="exit" goto exiter
goto bios_restart
:credits
REM Displays the credits
mode con: cols=65 lines=14 && title Scripty Credits && cls
call :scripty_banner
echo %e%[33mHuge Thank You to everyone that contributed to this project:%e%[0m
call :seperator
echo %e%[34mcylvin%e%[0m and my github link: %e%[92mgithub.com/cyl-vin%e%[0m
echo %e%[91mamakvana%e%[0m and their github link: %e%[92mhttps://github.com/amakvana%e%[0m
pause
goto main
:scripty_update
REM Allows Scripty to update/pulls raw code and over-writes the file before being relaunched w/ new code
mode con: cols=65 lines=10 && title Scripty Updater && cls
REM got this bit of code from reddit: https://www.reddit.com/r/Batch/comments/10whu4j/comment/j96lguw/?utm_source=share&utm_medium=web2x&context=3
if /i not "%~1"=="updated" (
    echo Updating %~nx0 ...
    >nul 2>&1 powershell iwr "https://raw.githubusercontent.com/cyl-vin/Scripty/main/scripty.bat" -OutFile "%temp%\%~nx0"
    >nul 2>&1 move /y "%temp%\%~nx0" "%~0"
    (start "%~dp0" "%~0" updated) & exit /b
)
cd /d "%~dp0"
cd /d "%~dp0"
goto main
:exiter
REM Exit confirmation menu
title Close and exit Scripty? && mode con: cols=65 lines=14 && cls
call :scripty_banner
echo %e%[33mAre you sure you want to%e%[0m %e%[31mLEAVE?%e%[0m
call :seperator
echo Type %e%[33mY%e%[0m and press %e%[32mENTER%e%[0m for yes
echo Type %e%[33mN%e%[0m and press %e%[32mENTER%e%[0m for no
call :seperator
set /p "exiting=%e%[31mExit?%e%[0m:%e%[92m-$%e%[0m "
if /i "%exiting%"=="y" exit
if /i "%exiting%"=="n" goto main
echo No option was chosen. Returning.
pause
goto exiter
:seperator
REM Displays seperator when called
echo %e%[36m----------------------------------------------------------------%e%[0m
exit /b
:scripty_banner
REM Displays the banner when called
echo %e%[36m----------------------------------------------------------------%e%[0m
echo %e%[34m   _____           _       __         %e%[0m      %e%[33mMade By:%e%[0m %e%[34mcylvin%e%[0m
echo %e%[34m  / ___/__________(_)___  / /___  __  %e%[0m%e%[92mgithub.com/cyl-vin/Scripty%e%[0m
echo %e%[34m  \__ \/ ___/ ___/ / __ \/ __/ / / /  %e%[0m   %e%[96m------------------%e%[0m
echo %e%[34m ___/ / /__/ /  / / /_/ / /_/ /_/ /   %e%[0m   %e%[96m: %date% :%e%[0m
echo %e%[34m/____/\___/_/  /_/ .___/\__/\__, /    %e%[0m   %e%[96m:   %time%  :%e%[0m
echo %e%[34m                /_/        /____/%e%[0m %e%[91mv2.1%e%[0m   %e%[96m------------------%e%[0m
echo %e%[36m----------------------------------------------------------------%e%[0m
exit /b
:egg
start https://www.youtube.com/watch?v=dQw4w9WgXcQ
exit /b
