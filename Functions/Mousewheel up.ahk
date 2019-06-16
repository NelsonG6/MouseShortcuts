; Mousewheel up
; Three options
$Wheelup::
	if (hold_toggle)
	{
		; Win + ctrl + Right
		; Go left one desktop
		Send {LWin Down}{Ctrl Down}{Right}{Ctrl up}{Lwin up}
		disable_hold_toggle := true 	
	}
	else if toggle
		; Soundset +1
		; Raise volume by one
		Soundset +1
		; Toggle doesn't end
	else if !toggle
		; Mousewheel up
		; Normal mouse behavior
		Send {Wheelup}
	CheckToggle()
	return