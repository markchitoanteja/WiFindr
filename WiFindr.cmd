@echo off
setlocal enabledelayedexpansion

:: Set console title
title Wi-Fi Password Extractor - by Mark Chito

:: Title card
cls
echo =============================================
echo         Wi-Fi Password Extractor v1.0         
echo             Created by Mark Chito    
echo =============================================
echo.

:: Set output path in the same folder as this script
set "script_dir=%~dp0"
set "output=%script_dir%wifi_passwords.txt"

:: Clear old output
if exist "%output%" del "%output%"

:: Write improved header to text file
>> "%output%" echo =================================================
>> "%output%" echo           Wi-Fi Password Extractor v1.0            
>> "%output%" echo               Created by Mark Chito    
>> "%output%" echo =================================================
>> "%output%" echo  Generated on: %DATE% at %TIME%
>> "%output%" echo =================================================
>> "%output%" echo.

:: Spinner setup
set "spinner=|/-\"
set /a spinCount=0

:: Status message
<nul set /p="Scanning saved Wi-Fi profiles"

:: Loop through profiles
for /f "tokens=*" %%A in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
  set "line=%%A"
  for /f "tokens=2 delims=:" %%B in ("!line!") do (
    set "profile=%%B"
    set "profile=!profile:~1!"  :: Remove leading space
    
    set "password="
    set "foundPass=0"
    
    for /f "tokens=2 delims=:" %%C in ('netsh wlan show profile name^="!profile!" key^=clear ^| findstr "Key Content"') do (
      set "password=%%C"
      set "password=!password:~1!"  :: Remove leading space
      set "foundPass=1"
    )
    
    :: Write entry to output file
    >> "%output%" echo ------------------------------------------------
    >> "%output%" echo SSID  : !profile!
    if !foundPass! == 1 if NOT "!password!" == "1" (
      >> "%output%" echo Password : !password!
      ) else (
      >> "%output%" echo Password : [No password found or not stored]
    )
    >> "%output%" echo.
    
    :: Show spinner animation in-place
    set /a "spinIndex=spinCount %% 4"
    set "char=!spinner:~%spinIndex%,1!"
    <nul set /p="."
    set /a spinCount+=1
  )
)

:: Final message
echo.
echo.
echo Done. 
echo All Wi-Fi passwords have been saved to: "wifi_passwords.txt"
echo.
pause
exit
