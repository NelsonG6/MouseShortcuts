; Middle mouse button
; Two options
$F20::
	if hold_toggle
	{
		; F6
		; Dual-window display in dopus
		Send {media_next}
		disable_hold_toggle := true
	}
		
	else if toggle
		; F6
		; Dual-window display in dopus
		Send {media_next}
	else if !toggle
		; Alt+F4
		; Close Window
		Send {Alt down}{F4}{Alt up} ; not sure i remember this being alt f4, thought that was the profile change button
	CheckToggle()
	return
