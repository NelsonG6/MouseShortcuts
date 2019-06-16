; Left mouse button
; Three functions
$LButton::
	if hold_toggle
	{
		; Alt + home
		; Go to homepage for mozilla and dopus
		Send {Alt down}{home}{alt up}
		disable_hold_toggle := true
	}
		
	else if toggle
		; Alt + home
		; Go to homepage for mozilla and dopus
		Send {Alt down}{home}{alt up}
	else if !toggle 
	{
		; Left mouse button
		; Normal mouse click
		Send {LButton down}
		KeyWait LButton
		Send {LButton Up}
	}
	SetCircledocksClosed()
	CheckToggle()
	return