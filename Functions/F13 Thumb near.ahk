; Thumb near
; Two options
$F13::
	if !toggle
		; Win + tab
		; Alternate alt+tab menu
		Send {LWinDown}{tab}{LWinUp}
	else if toggle
		; Enter
		; Just enter
		Send {Enter}
	CheckToggle()
	return