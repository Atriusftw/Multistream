			:: Top Left
start livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --no-osc --no-border --autofit=960x540 --screen 1 --geometry=0%%:0%%" twitch.tv/lirik source
			:: Top Right
start livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --no-osc --no-border --mute=yes --autofit=960x540 --screen 1 --geometry=100%%:0%%" twitch.tv/giantwaffle source
			:: Bottom Left 
start livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --no-osc --no-border --mute=yes --autofit=960x540 --screen 1 --geometry=0%%:100%%" twitch.tv/cincinbear source
			:: Bottom Right
start livestreamer --player="C:/Program Files/mpv/mpv.exe --ontop --no-osc --no-border --mute=yes --autofit=960x540 --screen 1 --geometry=100%%:100%%" twitch.tv/itmejp source
EXIT /B