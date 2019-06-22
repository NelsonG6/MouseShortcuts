

; Mousewheel Right
; Three options
$F19::
	if hold_toggle
	{
		; Shift + Win + Right
		; Move current window right one monitor
		Send {LShift down}{LWin down}{Right}{LWin up}{LShift up}
		disable_hold_toggle := true
	}
	else if(!toggle)
		; Alt + right
		; Go forward in history
		Send {Alt down}{right}{alt up}
	else if(toggle)
		; Control + pagedown
		; Move right one tab in dopus and firefox
		; Send {Ctrl down}{PGDN}{Ctrl up}
		; dont use
		; Toggle doesn't end
	CheckToggle()
	return