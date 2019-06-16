; Right mouse button
; Three functions
$RButton::
	if hold_toggle
	{
		; Alt + d then control + v
		; Go to navigation bar then paste
		Send !d
		Send ^v
		Send {Enter}
		rbutton_release_true := false
		disable_hold_toggle := true
	}
	else if toggle
	{
		; Alt + d then control + v
		; Go to navigation bar then paste
		Send !d
		Send ^v
		Send {Enter}
		toggle := false
		rbutton_release_true := false
	}
	else
	{
		; Right click
		; Normal right click
		Send {RButton down}
		KeyWait RButton
	}
	return

$RButton up::
	if rbutton_release_true
		Send {RButton up}
		; rbutton_release_true is true here,
		; so we will exit the if statment with rbutton_release_true
		; in the correct default state.
	else if not rbutton_release_true
		rbutton_release_true := true
		; Since rbutton is being released,
		; We're wrapping up using a function. Set rbutton back to default usage.
	SetCircledocksClosed()
	CheckToggle()
	return