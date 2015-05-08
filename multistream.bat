@echo off
SetLocal
ECHO Multistream v0.2
ECHO.
ECHO Currently only supports 1920x1080 and asks for four streams
ECHO.
ECHO.

set /P monitor=Type in monitor number: %=%
ECHO.
set /P stream_username1=Type in stream name 1: %=%
set /P stream_username2=Type in stream name 2: %=%
set /P stream_username3=Type in stream name 3: %=%
set /P stream_username4=Type in stream name 4: %=%

  echo Opening streams %stream_username1%, %stream_username2%, %stream_username3% and %stream_username4%
    start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --no-osc --no-border --autofit=960x540 --screen %monitor% --geometry=0%%:0%%" http://twitch.tv/%stream_username1% best --loglevel none
  	start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --no-osc --no-border --autofit=960x540 --screen %monitor% --geometry=100%%:0%%" http://twitch.tv/%stream_username2% best --loglevel none
  	start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --no-osc --no-border --autofit=960x540 --screen %monitor% --geometry=0%%:100%%" http://twitch.tv/%stream_username3% best --loglevel none
  	start /B livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --no-osc --no-border --autofit=960x540 --screen %monitor% --geometry=100%%:100%%" http://twitch.tv/%stream_username4% best --loglevel none
EXIT /B
	)
EndLocal	