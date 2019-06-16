; Mousewheel Press
; Three options
$F17::
	if hold_toggle
	{
		; F6
		; Dopus split screen
		Send, {F6}
		disable_hold_toggle := true
	}
		
	else if toggle
		; ctrl + shift + lbutton
		; open new tab and navigate to it
		Send ^+{LButton}
	else if !toggle
		; Middle mouse press
		; Just presses the middle mouse button
		Send {MButton down}
		Keywait Mbutton 
	return

$F17 up::
	Send {Mbutton up}
	CheckToggle()
	return