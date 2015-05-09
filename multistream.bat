@echo off
SetLocal
set version=1.0.2
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


if %streamcount% EQU 1 (
    start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=%res% --screen %monitor% --geometry=0%%:0%%" http://twitch.tv/%stream_username1% best --loglevel error
    )

if %streamcount% EQU 2 (
    start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=%res% --screen %monitor% --geometry=0%%:0%%" http://twitch.tv/%stream_username1% best --loglevel error
    start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=%res% --screen %monitor% --geometry=100%%:0%%" http://twitch.tv/%stream_username2% best --loglevel error
    )

if %streamcount% EQU 3 (
    start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=%res% --screen %monitor% --geometry=0%%:0%%" http://twitch.tv/%stream_username1% best --loglevel error
    start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=%res% --screen %monitor% --geometry=100%%:0%%" http://twitch.tv/%stream_username2% best --loglevel error
  	start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=%res% --screen %monitor% --geometry=100%%:0%%" http://twitch.tv/%stream_username3% best --loglevel error   
    )

if %streamcount% EQU 4 (
    start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=%res% --screen %monitor% --geometry=0%%:0%%" http://twitch.tv/%stream_username1% best --loglevel error
    start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=%res% --screen %monitor% --geometry=100%%:0%%" http://twitch.tv/%stream_username2% best --loglevel error
  	start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=%res% --screen %monitor% --geometry=0%%:100%%" http://twitch.tv/%stream_username3% best --loglevel error   
  	start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=%res% --screen %monitor% --geometry=100%%:100%%" http://twitch.tv/%stream_username4% best --loglevel error    
    )
echo.
echo.

if %streamcount% EQU 1 (
	echo Showing %streamcount% stream on monitor number %monitor%..
	echo Close this window to stop the stream.
	)

if %streamcount% GTR 1 (
	echo Showing %streamcount% streams on monitor number %monitor%..
	echo Close this window to stop the streams.
	)

EXIT /B
	)
EndLocal