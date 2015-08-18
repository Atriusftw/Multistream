@echo off
SetLocal
set version=1.0.3
TITLE Multistream v%version%
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
:::
:::
:::                   ________________________
:::          (__)    /                        \         
:::          (oo)   (   Multistream r so kewl  )
:::   /-------\/  --'\________________________/        
:::  / |     ||
::: *  ||----||
:::    ^^    ^^             
:::
ECHO Version %version%
ECHO.
ECHO Currently only have hardcoded resolutions =(
ECHO.
ECHO ---------------------------------------------
ECHO.

:start1
set /P monitor=Type in monitor number: %=%
echo.
ECHO ---------------------------------------------
if [%monitor%] EQU [] (
	echo.
	echo Im pretty sure you need a monitor of some sort to watch streams. 
	echo Let me know which one please.
	echo.
	pause
	cls
	goto start1
	)

:start2
echo.
echo [1] 1920x1080
echo [2] 1680x1050
echo [3] 1600x1024
echo [4] 1600x900
echo.
set /P resolution=Select your resolution: %=%
if [%resolution%] EQU [] (
	echo.
	echo Im pretty sure your monitor has a resolution. 
	echo Let me know what it is please.
	echo.
	pause
	cls
	goto start2
	)
if %resolution% GTR 4 (
	echo.
	echo No such resolution. 
	echo Try again.
	echo.
	pause
	cls
	goto start2
	)

if %resolution% EQU 1 (
	set res="960x540"
	)
if %resolution% EQU 2 (
	set res="840x525"
	)
if %resolution% EQU 3 (
	set res="800x512"
	)
if %resolution% EQU 4 (
	set res="800x450"
	)

:start3
echo.
ECHO ---------------------------------------------
echo.
set /P streamcount=Type in number of streams (1-4): %=%
ECHO.

if [%streamcount%] EQU [] (
	echo.	
	echo I thought you wanted to watch some streams? Please let me know how many.
	echo.	
	pause
	cls
	goto start3
	)

if %streamcount% EQU 1 (
echo.
ECHO ---------------------------------------------
echo.
		set /P stream_username1=Type in stream name 1: %=%
		)

if %streamcount% EQU 2 (
echo.
ECHO ---------------------------------------------
echo.
		set /P stream_username1=Type in stream name 1: %=%
		set /P stream_username2=Type in stream name 2: %=%
		)

if %streamcount% EQU 3 (
echo.
ECHO ---------------------------------------------
echo.
		set /P stream_username1=Type in stream name 1: %=%
		set /P stream_username2=Type in stream name 2: %=%
		set /P stream_username3=Type in stream name 3: %=%
		)

if %streamcount% EQU 4 (
echo.
ECHO ---------------------------------------------
echo.
		set /P stream_username1=Type in stream name 1: %=%
		set /P stream_username2=Type in stream name 2: %=%
		set /P stream_username3=Type in stream name 3: %=%
		set /P stream_username4=Type in stream name 4: %=%
		)


:start3bis
echo.
:: worst  --default-stream=worst,mobile,low,medium,high,best,source
:: mobile --default-stream=mobile,low,worst
:: low    --default-stream=low,mobile,medium,worst
:: medium --default-stream=medium,low,high,worst
:: high   --default-stream=high,medium,best
:: source --default-stream=source,best
:: best   --default-stream=source,best,high,medium,low,mobile,worst

echo [1] best (source)
echo [2] high (with fallback to medium,source)
echo [3] medium (with fallback to low,high,worst)
echo [4] low (with fallback to mobile,medium,worst)
echo [5] worst (mobile with fallback to low,worst)
echo.
set /P quality=Select your quality: %=%
if [%quality%] EQU [] (
	echo.
	echo Im pretty sure your stream has a quality. 
	echo Let me know what it is please.
	echo.
	pause
	cls
	goto start3bis
	)
if %quality% GTR 5 (
	echo.
	echo No such quality. 
	echo Try again.
	echo.
	pause
	cls
	goto start3bis
	)

if %quality% EQU 1 (
	set quality="source,best"
	)
if %quality% EQU 2 (
	set quality="high,medium,best"
	)
if %quality% EQU 3 (
	set quality="medium,low,high,worst"
	)
if %quality% EQU 4 (
	set quality="low,mobile,medium,worst"
	)
if %quality% EQU 5 (
	set quality="mobile,low,worst"
	)

set "player=mpv.exe"
set "playerargs=--ontop --mute=yes --volume=100 --no-osc --no-border"

if %streamcount% EQU 1 (
    start /B livestreamer --player="%player% %playerargs% --autofit=%res% --screen %monitor% --geometry=0%%:0%%" http://twitch.tv/%stream_username1% --default-stream=%quality% --loglevel error
    )

if %streamcount% EQU 2 (
    start /B livestreamer --player="%player% %playerargs% --autofit=%res% --screen %monitor% --geometry=0%%:0%%" http://twitch.tv/%stream_username1% --default-stream=%quality% --loglevel error
    start /B livestreamer --player="%player% %playerargs% --autofit=%res% --screen %monitor% --geometry=100%%:0%%" http://twitch.tv/%stream_username2% --default-stream=%quality% --loglevel error
    )

if %streamcount% EQU 3 (
    start /B livestreamer --player="%player% %playerargs% --autofit=%res% --screen %monitor% --geometry=0%%:0%%" http://twitch.tv/%stream_username1% --default-stream=%quality% --loglevel error
    start /B livestreamer --player="%player% %playerargs% --autofit=%res% --screen %monitor% --geometry=100%%:0%%" http://twitch.tv/%stream_username2% --default-stream=%quality% --loglevel error
  	start /B livestreamer --player="%player% %playerargs% --autofit=%res% --screen %monitor% --geometry=100%%:0%%" http://twitch.tv/%stream_username3% --default-stream=%quality% --loglevel error   
    )

if %streamcount% EQU 4 (
    start /B livestreamer --player="%player% %playerargs% --autofit=%res% --screen %monitor% --geometry=0%%:0%%" http://twitch.tv/%stream_username1% --default-stream=%quality% --loglevel error
    start /B livestreamer --player="%player% %playerargs% --autofit=%res% --screen %monitor% --geometry=100%%:0%%" http://twitch.tv/%stream_username2% --default-stream=%quality% --loglevel error
  	start /B livestreamer --player="%player% %playerargs% --autofit=%res% --screen %monitor% --geometry=0%%:100%%" http://twitch.tv/%stream_username3% --default-stream=%quality% --loglevel error   
  	start /B livestreamer --player="%player% %playerargs% --autofit=%res% --screen %monitor% --geometry=100%%:100%%" http://twitch.tv/%stream_username4% --default-stream=%quality% --loglevel error    
    )
echo.
echo.

if %streamcount% EQU 1 (
	echo Showing %streamcount% stream on monitor number %monitor%..
	echo Close this window to stop the stream.
	echo.
	echo MPV Keyboard Control Help
	echo =========================
	echo.
	echo p / SPACE
	echo Pause (pressing again unpauses).
	echo.
	echo / and * or 9 and 0
	echo Decrease/increase volume.
	echo.
	echo m
	echo Mute sound.
	echo.
	echo More help at http://mpv.io/manual/stable/
	)

if %streamcount% GTR 1 (
	echo Showing %streamcount% streams on monitor number %monitor%..
	echo Close this window to stop the streams.
	echo.
	echo MPV Keyboard Control Help
	echo =========================
	echo.
	echo p / SPACE
	echo Pause (pressing again unpauses).
	echo.
	echo / and * or 9 and 0
	echo Decrease/increase volume.
	echo.
	echo m
	echo Mute sound.
	echo.
	echo More help at http://mpv.io/manual/stable/
	)

EXIT /B
	)
EndLocal
