; Thumb far
; Two options
$*F14::
	if(circledock1 || circledock2 || circledock3)
	{
		if circledock1
		{
			Send {F22}
			circledock1 := false
		}
		if circledock2
		{
			Send {F23}
			circledock2 := false
		}
		if circledock3
		{
			Send {F24}
			circledock3 := false
		}
		KeyWait F14 ; I think this will fix it
	}
	else
	{ ; circledocks weren't open
		if hold_toggle
		{ ; Second circledock
			Send {F23}
			circledock2 := true
			disable_hold_toggle := true
		}
		else if toggle
		{
			; Second circledock
			Send {F23}
			toggle := false ; toggle disables once toggle function used
			circledock2 := true
		}
		else
		{
			start:=A_TickCount
			KeyWait F14
			end:=A_TickCount - start
			if(end < 250)
			{ ; wait
				Send {F22}
				circledock1 := true
			}
			else
			{
				Send {F24}
				circledock3 := true
			}
		}
	}
	CheckToggle()
	return