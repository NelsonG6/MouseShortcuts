; Index near (down)
; Three options
$F15::
	if hold_toggle
	{
		; Win + down
		; Minimize window
		Send {Alt down}{Space down}n{Space up}{Alt up}		
		disable_hold_toggle := true
	}
		
	else if toggle
	{
		; media play pause
		; play/pause media
		spoofy := new Spotify
		spoofy.Player.PlayPause()
		toggle := false
	}
	else if !toggle 
		; Control + t, then alt + home
		; New tab and then go to homepage, for dopus and mozilla
		Send {Ctrl down}t{Ctrl up}{Alt down}{Home}{Alt up}
	CheckToggle()
	return