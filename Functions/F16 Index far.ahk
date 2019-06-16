; Index far
; Two options
$F16::
	if hold_toggle
	{
		; Windows key + up
		; Maximize window
		Send {LWin down}{up}{Lwin up}
		disable_hold_toggle := true
	}

		
	else if toggle
		; alt + l
		; toggle youtube playback in chrome
		; never use this
		Send ^!{F2}
	else if !toggle
		; Control + w
		; Close tab
		Send {Ctrl down}w{Ctrl up}
	CheckToggle()
	return