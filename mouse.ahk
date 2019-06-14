SendMode, Input
#MaxHotkeysPerInterval 500
#Include Spotify.ahk
global toggle = false
global hold_toggle = false
global hold_toggle_command_true = false
global monitor_toggle = false


; This variable is to handle if the system should be sent the rbutton release command.
; It will not need to be send if a toggle right-click was used.
global rbutton_release_true = true

Exit

; Thumb near
; Two options
$F13::
	if !toggle
		; Win + tab
		; Alternate alt+tab menu
		Send ^!{tab}
	else if toggle
	{
		; Enter
		; Just enter
		Send {Enter}
		toggle := false
	}
	return

; Thumb far
; Two options
$F14::
	if hold_toggle
	{
		; There is no hold-toggle function set, so just assume the user meant to toggle.
		; Backspace
		; For Dopus to go back in history one entry
		Send {F23}
		hold_toggle_conmmand_true := true
		return
	}
	else if toggle
	{
		; There is no hold-toggle function set, so just assume the user meant to toggle.
		; Backspace
		; For Dopus to go back in history one entry
		Send {F23}
		toggle := false
		return
	}
	
	; Else
	Send {F22}
	return

; Index near (down)
; Three options
$F15::
	if hold_toggle
	{
		; Win + down
		; Minimize window
		Send {Alt down}{Space down}n{Space up}{Alt up}
		hold_toggle_command_true := true
	}
	else if toggle
	{
		; media play pause
		; play/pause media
		spoofy := new Spotify
		spoofy.Player.PlayPause()
		toggle := false
	}
	else if !toggle 
		; Control + t, then alt + home
		; New tab and then go to homepage, for dopus and mozilla
		Send {Ctrl down}t{Ctrl up}{Alt down}{Home}{Alt up}
	return

; Index far
; Two options
$F16::
	if hold_toggle
	{
		; Windows key + up
		; Maximize window
		Send {LWin down}{up}{Lwin up}
		hold_toggle_command_true := true
	}
	else if toggle
	{
		; alt + l
		; toggle youtube playback in chrome
		Send ^!{F2}
		toggle := false
	}
	else if !toggle
		; Control + w
		; Close tab
		Send {Ctrl down}w{Ctrl up}
	return

; Mousewheel Press
; Three options
$F17::
	if hold_toggle
	{
		; F6
		; Dopus split screen
		Send, {F6}
		hold_toggle_command_true := true
	}
	else if toggle
	{
		; ctrl + shift + lbutton
		; open new tab and navigate to it
		Send ^+{LButton}
		toggle := false
	}
	else if !toggle
		; Middle mouse press
		; Just presses the middle mouse button
		Send {MButton down}
		Keywait Mbutton
	return

$F17 up::
	Send {Mbutton up}
	return

; Mousewheel Left
; Three options
$F18::
	if hold_toggle
	{
		; Shift + Win + Left
		; Move window to left monitor
		Send {LShift down}{LWin down}{Left}{LWin Up}{LShift up}
		hold_toggle_command_true := true
	}
	else if !toggle
		; Alt + Left
		; Go back to previous page in history
		Send {LAlt down}{Left}{LAlt up}
	else if toggle
		; Control + Pageup
		; Move left one tab in dopus or firefox
		Send {Ctrl down}{PGUP}{Ctrl up}
	return


; Mousewheel Right
; Three options
$F19::
	if hold_toggle
	{
		; Shift + Win + Right
		; Move current window right one monitor
		Send {LShift down}{LWin down}{Right}{LWin up}{LShift up}
		hold_toggle_command_true := true
	}
	else if(!toggle)
		; Alt + right
		; Go forward in history
		Send {Alt down}{right}{alt up}
	else if(toggle)
		; Control + pagedown
		; Move right one tab in dopus and firefox
		Send {Ctrl down}{PGDN}{Ctrl up}
		; Toggle doesn't end
	return

; Change profile button
; Two options
$F20::
	if hold_toggle
	{
		; F6
		; Dual-window display in dopus
		Send {media_next}
		hold_toggle_command_true := true
	}
	else if toggle
	{
		; F6
		; Dual-window display in dopus
		Send {media_next}
		toggle := false
	}
	else if !toggle
		; Alt+F4
		; Close Window
		Send {Alt down}{F4}{Alt up}
	return

; Toggle button
$F21::
	hold_toggle := true
	KeyWait F21
	return

$F21 Up::
	if hold_toggle_command_true
		; If a command was sent that required holding toggle down, always reset to toggle off afterwards.
		toggle := false
	else
		toggle := !toggle
	hold_toggle := false
	hold_toggle_command_true := false
	return


; Left mouse button
; Three functions
$LButton::
	if hold_toggle
	{
		; Alt + home
		; Go to homepage for mozilla and dopus
		Send {Alt down}{home}{alt up}
		hold_toggle_command_true = true
	}
	else if toggle
	{
		; Alt + home
		; Go to homepage for mozilla and dopus
		Send {Alt down}{home}{alt up}
		toggle := false
	}	
	else if !toggle 
	{
		; Left mouse button
		; Normal mouse click
		Send {LButton down}
		KeyWait LButton
		Send {LButton Up}
	}
	
	return

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
		hold_toggle_command_true := true
		rbutton_release_true := false
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
	return
	
; Mousewheel down
; Three options
$WheelDown::
	if (hold_toggle)
	{
		; Win + ctrl + left
		; Go left one desktop
		Send {LWin Down}{Ctrl Down}{Left}{Ctrl up}{Lwin up}
		hold_toggle_command_true := true
	}
	if toggle
		; Sounset -1
		; Lower volume by one
		SoundSet -1
		; Toggle not ended
	else if !toggle
		; Mousewheel down
		; Normal mouse behavior
		Send {Wheeldown}
	return

; Mousewheel up
; Three options
$Wheelup::
	if (hold_toggle)
	{
		; Win + ctrl + Right
		; Go left one desktop
		Send {LWin Down}{Ctrl Down}{Right}{Ctrl up}{Lwin up}
		hold_toggle_command_true := true
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
	return


; Send {RCtrl}
; Sleep 500
; Send {RCtrl}
; Sleep 500
; Send {1}
; Sleep 500
; Send {Enter}
; monitor_toggle = 2


; Send {Ctrl down}{PGDN}{Ctrl up}

; Send {Ctrl down}{PGDN}{Ctrl up}