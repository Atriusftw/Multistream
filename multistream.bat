@echo off
set version=1.0.1
TITLE Multistream v%version%
SetLocal
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
ECHO Currently only supports 1920x1080 and asks for four streams
ECHO.
ECHO ___________________________________________________________
ECHO.

set /P monitor=Type in monitor number (1-32): %=%
ECHO.
	set /P stream_username1=Type in stream name 1: %=%
	set /P stream_username2=Type in stream name 2: %=%
	set /P stream_username3=Type in stream name 3: %=%
	set /P stream_username4=Type in stream name 4: %=%

echo Opening streams on monitor number %monitor%..
    start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=960x540 --screen %monitor% --geometry=0%%:0%%" http://twitch.tv/%stream_username1% best --loglevel error
  	start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=960x540 --screen %monitor% --geometry=100%%:0%%" http://twitch.tv/%stream_username2% best --loglevel error
  	start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=960x540 --screen %monitor% --geometry=0%%:100%%" http://twitch.tv/%stream_username3% best --loglevel error
  	start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --mute=yes --no-osc --no-border --autofit=960x540 --screen %monitor% --geometry=100%%:100%%" http://twitch.tv/%stream_username4% best --loglevel error
EXIT /B
	)
EndLocal	