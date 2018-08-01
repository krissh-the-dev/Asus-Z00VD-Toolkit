::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpARA2MPXm7H7QS6ebHy++UqVkSRN4yYc/M1aaFHOkQ5Uv3SbIoxXNdlskDAA9LMzS5awp5intWsym2P8aYtguseUeK70o8VkR6g3HfhS91adBn+g==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZk4aHErQXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlHi
::ZQ05rAF9IAHYFVzEqQIRGy5nDD7SbF2eRpQ4yqjPwMWriWQpNA==
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJ6HBNRDBaHP2SsA6cFqOH27u2CsQ0cWuZ/bYHX1beFYO0W/k3rcYVt12hf2MgDAQtZahupYgp0pmBOrySDONXckjzUeQizthsGPwU=
::dhA7uBVwLU+EWHKW/VE4JhoUYQuNLn+yH9U=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEqE0gLRUZXwuXLmi/WNU=
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDpARA2MPXm7H7QS6ebHy++UqVkSRN4yYc/M1aaFHPQc5UnvfIIRwnVVlMAFGFYOKlyudgpU
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
cls
@title ASUS Z00VD ADB TOOLKIT
@color cf

echo.
echo.
echo  ********************************************************
echo  *                ASUS Z00VD ADB TOOLKIT                *	 
echo  *                  by Krishna Moorthy                  *
echo  *          https://12androidzone.blogspot.com          *
echo  ********************************************************
echo  * (open-source)                               Ver. 1.5 *
echo  ********************************************************
echo.
echo  ### Please read readme.txt before using the tool.
echo  ### Please report if some commands did not work.
echo.
echo  Loading...
echo.


adb.exe kill-server
adb.exe start-server
sleep 2
adb.exe devices
fastboot.exe devices

adb.exe version

echo.
pause.
goto menu


:menu
cls
echo.
echo  ********************************************************
echo  *                ASUS Z00VD ADB TOOLKIT                *	 
echo  *                  by Krishna Moorthy                  *
echo  ********************************************************
echo  *                                             Ver. 1.5 *
echo  ********************************************************
echo.
echo                   == MENU ==
echo.

echo          [1] Unlock bootloader
echo          [2] Relock bootloader
echo          [3] Flash stock recovery
echo          [4] Flash TWRP recovery
echo          [5] Boot TWRP without flashing
echo          [6] One click unlock, twrp and root.
echo.
echo          [7] Get device details (adb only)
echo          [8] Reboot bootloader (adb only)
echo          [9] Reboot Recovery (adb only)
echo         [10] Reboot System (fastboot)
echo         [11] Sideload update through recovery
echo         [12] Factory data reset
echo.
echo         [13] Install ADB and Fastboot drivers
echo         [14] Restart adb server

echo.
set /p choice=      # Enter the number to perform curresponding action...

if '%choice%'=='1' goto unlock
if '%choice%'=='2' goto lock
if '%choice%'=='3' goto stock
if '%choice%'=='4' goto twrp
if '%choice%'=='5' goto boot
if '%choice%'=='6' goto root

if '%choice%'=='7' goto details
if '%choice%'=='8' goto bootloader
if '%choice%'=='9' goto recovery
if '%choice%'=='10' goto system
if '%choice%'=='11' goto update
if '%choice%'=='12' goto reset

if '%choice%'=='debug' goto bug
if '%choice%'=='13' goto drivers
if '%choice%'=='14' goto server


if '%choice%'=='one' goto unlock
if '%choice%'=='two' goto lock
if '%choice%'=='three' goto stock
if '%choice%'=='four' goto twrp
if '%choice%'==five' goto boot
if '%choice%'=='six' goto root

if '%choice%'=='seven' goto details
if '%choice%'=='eight' goto bootloader
if '%choice%'=='nine' goto recovery
if '%choice%'=='ten' goto system
if '%choice%'=='eleven' goto update
if '%choice%'=='twelve' goto reset


goto menu


:unlock
color 04

echo.
echo Your device will be unlocked.
echo Note: User data may be erased.
echo. 
pause

color cf

adb.exe wait-for-device
adb.exe reboot bootloader
fastboot.exe oem unlock

echo.
set /p wi=      Do you want to erase user data? (Y/N)

if '%wi%'=='Y' goto reset

if '%wi%'=='y' goto reset

if '%wi%'=='yes' goto reset

if '%wi%'=='YES' goto reset


fastboot.exe reboot
echo '
echo '
echo '
echo DONE!
pause>nul
cls
goto menu

:lock
color 0a
echo.
echo Your device bootloader will be locked.
echo Note: User data may be erased.
echo. 
pause
color cf

adb.exe wait-for-device
adb.exe reboot bootloader
fastboot.exe oem lock

echo.
set /p wip=      Do you want to erase user data? (Y/N)

if '%wip%'=='Y' goto reset

if '%wip%'=='y' goto reset

if '%wip%'=='yes' goto reset

if '%wip%'=='YES' goto reset



fastboot.exe reboot

echo '
echo '
echo '
echo DONE!
pause>nul
cls
goto menu

:stock

echo.
echo Reboot bootloader and flash stock recovery?...
echo. 
pause

adb.exe wait-for-device
adb.exe reboot bootloader
fastboot.exe flash recovery stock.img
fastboot.exe reboot

echo '
echo '
echo '
echo DONE!
pause>nul
cls
goto menu

:twrp

echo.
echo Reboot bootloader and flash TWRP recovery?
echo. 
pause

adb.exe wait-for-device
adb.exe reboot bootloader
fastboot.exe flash recovery twrp.img

echo.
echo TWRP recovery has been flashed.

fastboot.exe reboot

sleep 15

echo.
echo If your device did not reboot system, do
echo it manually.
pause>nul
echo.
echo Do you want to reboot recovery now?
echo.
set /p rec= (Y/N)

if '%rec%'=='Y' goto recovery
if '%rec%'=='N' goto menu
if '%rec%'=='y' goto recovery
if '%rec%'=='n' goto menu
if '%rec%'=='yes' goto recovery
if '%rec%'=='no' goto menu
if '%rec%'=='YES' goto recovery
if '%rec%'=='NO' goto menu

   
echo.
pause>nul
cls
goto menu

:boot

echo.
echo Boot TWRP without flashing?
echo This will reboot your device.
echo. 
pause


adb.exe reboot bootloader

echo.
echo Booting...
fastboot.exe boot twrp.img
sleep 2

echo '
echo '
echo '
echo DONE!
pause>nul
cls


goto menu


:details
echo.
echo Fetching device details...
echo Note: This will not pull details from fastboot
sleep 1
echo. 

adb.exe devices
echo Device state: 
adb.exe get-state
fastboot.exe devices

echo.
echo Pulling build.prop ...
echo.
adb pull /system/build.prop
echo.
echo Pulling xposed.prop ...
echo.
adb pull /system/xposed.prop
echo Prop files are copied to the platform folder.
echo.
echo build.prop :
type build.prop

echo.
pause>nul
cls
goto menu

:bootloader
echo.
echo Reboot bootloader?
echo. 
pause

adb.exe wait-for-device
adb.exe devices 
adb.exe reboot bootloader

sleep 3

echo.
echo Your device has booted into Fastboot mode.
pause>nul
cls
goto menu

:recovery
echo.
echo Reboot recovery?
echo. 
pause

adb.exe wait-for-device
adb.exe devices
adb.exe reboot recovery

sleep 5

echo.
echo Your device has booted into Recovery mode.
pause>nul
cls
goto menu

:system
echo.
echo Reboot system?
echo. 
pause

adb.exe reboot

fastboot.exe devices
fastboot.exe reboot
sleep 15
echo.
echo Your device would have rebooted. If not, long press power key.
pause>nul
cls
goto menu

:update
echo. 
echo # Sideload update through recovery:
echo Place the zip in the platform folder and rename it as 'update.zip'
echo ('.zip' is the extension and should not be added to the filename)
echo.
echo (!) Your device will reboot into recovery to flash the file.
echo.
pause

adb.exe wait-for-device
adb.exe reboot recovery

sleep 5

adb.exe wait-for-device

echo. 
echo Your device has booted into recovery.
echo Select the 'Sideload' option.
echo Press any key when you're done.
echo. 

adb.exe wait-for-device
adb.exe get-state
adb.exe sideload update.zip

echo.
pause>nul
cls
goto menu

:reset
color 04

echo.
echo    Erase user data and cache?
echo    All your data including contacts, apps, 
echo    call logs will be deleted.
echo. 
pause


adb.exe reboot bootloader
fastboot.exe -w
fastboot.exe reboot

color cf

echo '
echo '
echo '
echo DONE!
pause>nul
cls
goto menu

:root
color 04

echo. 
echo     ## ONE-CLICK EASY ROOT ##
echo     Proceed with caution.
echo.
pause 

echo This will unlock your bootloader and flash TWRP.
echo.
echo Note: If your device did not boot into TWRP automatically, 
echo       do it manually either using the buttons or the tool.
echo.
echo (!) This maight erase user data.
pause 

adb.exe reboot bootloader
adb.exe push supersu.zip storage/emulated/0


fastboot.exe push supersu.zip storage/emulated/0
fastboot.exe oem unlock

fastboot.exe flash recovery twrp.img
fastboot.exe boot twrp.img

echo.
echo Your bootloader has been unlocked and TWRP is installed.
echo.
pause>nul
echo.
color cf
echo You can install supersu.zip, copied to your internal storage or 
echo you can choose to sideload the su-binary.
echo.
echo [1] Install manually
echo [2] Sideload
echo.
set /p roo=      # Enter the number to choose curresponding action...

if '%roo%'=='1' goto menu
if '%roo%'=='2' goto sidesu


goto menu

:sidesu
echo.
echo Activate the sideload feature to flash Super SU.
echo.
pause


adb.exe get-state
adb.exe sideload supersu.zip


echo.
echo Congracts, your device is ROOTED succesfully.
echo You can reboot to system manually.
echo.
pause>nul


goto menu

:bug
echo.
echo (!)This feature is only for developers.
echo (!)This will take a while.
echo.
pause

adb.exe bugreport

echo '
echo '
echo '
echo DONE!
pause>nul

goto menu


:server

echo.
echo This will restart the adb daemon as well as the toolkit.
pause>nul

cls
@title ASUS Z00VD ADB TOOLKIT
@color cf

echo.
echo.
echo  ****************************************************
echo  *                ASUS Z00VD ADB TOOLKIT                *	 
echo  *                  by Krishna Moorthy                  *
echo  *          https://12androidzone.blogspot.com          *
echo  ********************************************************
echo  *                                             Ver. 1.5 *
echo  ********************************************************
echo.
echo ### Please read readme.txt before using the tool.
echo ### Make sure ADB and Fastboot drivers are properly installed.
echo.
echo Loading...
echo.


adb.exe kill-server
adb.exe start-server
sleep 2
adb.exe devices
fastboot.exe devices

adb.exe version

echo.
pause.
goto menu

:drivers

echo.
echo The toolkit will open the driver setup wizards
echo one by one automatically. Install each of them. 
echo.
echo Read the readme.txt before proceeding.
pause


echo.
echo Installing Google USB drivers...
echo.
start google-driver.exe
sleep 15

echo.
echo Installing Intel USB drivers...
echo.
start intel-driver.exe
sleep 10

echo.
echo (Optional) Android Mobile driver
echo.
start mob-adb.exe

sleep 5

echo '
echo '
echo '
echo DONE!
pause>nul

goto menu





