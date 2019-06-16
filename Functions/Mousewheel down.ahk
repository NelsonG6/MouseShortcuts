; Mousewheel down
; Three options
$WheelDown::
	if (hold_toggle)
	{
		; Win + ctrl + left
		; Go left one desktop
		Send {LWin Down}{Ctrl Down}{Left}{Ctrl up}{Lwin up}
		disable_hold_toggle := true 
	}
	if toggle
		; Soundset -1
		; Lower volume by one
		SoundSet -1
		; Toggle not ended
	else if !toggle
		; Mousewheel down
		; Normal mouse behavior
		Send {Wheeldown}
	CheckToggle()
	return