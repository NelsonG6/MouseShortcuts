

; Mousewheel Left
; Three options
$F18::
	if hold_toggle	
	{
		; Shift + Win + Left
		; Move window to left monitor
		Send {LShift down}{LWin down}{Left}{LWin Up}{LShift up}
		disable_hold_toggle := true
	}
		
	else if !toggle
		; Alt + Left
		; Go back to previous page in history
		Send {LAlt down}{Left}{LAlt up}
	else if toggle
		; Control + Pageup
		; Move left one tab in dopus or firefox
		; Send {Ctrl down}{PGUP}{Ctrl up}
		; never use this so removing for now
	CheckToggle()	
	return