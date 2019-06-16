SendMode, Input
#MaxHotkeysPerInterval 500
global toggle = false
global hold_toggle = false
global toggle_pressed = false
global disable_hold_toggle := false
global circledock1 = false
global circledock2 = false
global circledock3 = false

#Include Spotify\Spotify.ahk

#Include Functions\F13 Thumb near.ahk
#Include Functions\F14 Thumb far.ahk
#Include Functions\F15 Index near.ahk
#Include Functions\F16 Index far.ahk
#Include Functions\F17.ahk
#Include Functions\F18.ahk
#Include Functions\F19.ahk
#Include Functions\F20.ahk
#Include Functions\Mouse button right.ahk
#Include Functions\Mouse button left.ahk
#Include Functions\Mousewheel down.ahk
#Include Functions\Mousewheel up.ahk

; This variable is to handle if the system should be sent the rbutton release command.
; It will not need to be send if a toggle right-click was used.
global rbutton_release_true = true

Exit

; Toggle button
*F21::
	toggle_pressed := true ; Helps manage when to release "hold toggle" state
	start := A_TickCount
	if(toggle or hold_toggle)
	{
		toggle := false
		hold_toggle := false
	}
	else
	{
		hold_toggle := true
		KeyWait F21
		; F21 has been released now.
		if(disable_hold_toggle)
		{
			disable_hold_toggle := false
			hold_toggle := false
		}
		else
		{
			end := A_TickCount - start
			if(end < 250) ; toggle button was pressed and released in less than 250 ticks
			{
				toggle := true ; toggle	
				hold_toggle := false
			}
			; otherwise, hold toggle will stay on from.
		}
	}
	toggle_pressed := false ; the physical state of the toggle button
	return




CheckToggle()
{
	toggle := false
	if(!toggle_pressed)
		hold_toggle := false
}

SetCircledocksClosed()
{	; after a left click or a right click, assume the circle dock is going to be closed in some way other than the circledock button (far thumb)
	circledock1 := false
	circledock2 := false
	circledock3 := false
}

