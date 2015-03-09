CrosshairLIndex := 2

bind(key, sub)
{
    global
    if(key = "Alt")
    {
        AltBind := true
        AltKey := key
        AltSub := sub
    }
    else if(key = "Shift")
    {
        ShiftBind := true
        ShiftKey := key
        ShiftSub := sub
    }
    else if(key = "Ctrl")
    {
        CtrlBind := true
        CtrlKey := key
        CtrlSub := sub
    }
    else
    {
		StringLower, key, key 
        Hotkey, *%key%, %sub%  ; UseErrorLevel
    }
}

NoLockKey(key, event, target = false)
{
    global
    If (locked)
    {
		NoLockPressed := 1
		RubberMouse(false)
        Send, {RButton Up}
        key(key, event, target)
		mouseCenterLock()
		RubberMouse(true)
		NoLockPressed := 0
    }
    else
    {
        keyPress(key, key)
    }
}

mouseCenterLock()
{
	global CH_Height
	BlockInput, MouseMove
	WinGetPos, WinX, WinY, WinW, WinH, Guild Wars 2
	WinCenterX := WinW/2 + WinX
	WinCenterY := WinH/2 + WinY
	DllCall("SetCursorPos", int, (WinCenterX-4) , int, (WinCenterY + CH_Height))
	Send, {RButton Down}
	MouseMove 4, 0, 0, R
	BlockInput, MouseMoveOff
}

key(key, event, target = true)
{
    global
	StringLower, key, key
    if (locked)
    {
        if(target)
        {
            Send, {%TargetKey% Up}
			Sleep, 50
            Send, {%TargetKey% Down}
            KeyWait, % TargetKey
        }
		keyPress(key, event)
    }
    else
    {
        keyPress(key, key)
    }
}

keyPress(key,event)
{
	global locked
	Send, {%event% Down}
	if(key != "WheelUp" && key != "WheelDown")
		KeyWait, % key
	Send, {%event% Up}
	RMBIsDown := GetKeyState("RButton")
	if(locked && RMBIsDown)
		Send, {RButton Down}
	else if(locked = 0 && RMBIsDown)
	{
		Send, {RButton Up}
		RubberMouse(false)
	}
}

;-----------------------------Crosshair Painter--------------------------------

crosshairGUI(Picture, X, Y, Scale = 100)
{
    global OverlayImage
	global CrosshairLIndex
	Label := "Crs"
	Label .= CrosshairLIndex
    tmp := Scale/2
    tmpy := Round(Y-tmp)
    tmpx := Round(X-tmp)
    Gui, %Label%:Margin , 0, 0
    Gui, %Label%:Add, Picture, w%Scale% h%Scale% vOverlayImage, %Picture%
    Gui, %Label%:Color, ECE9D8
    Gui, %Label%:+LastFound -Caption +AlwaysOnTop +ToolWindow -Border
    Winset, TransColor, ECE9D8 150
	WinSet,ExStyle,^0x20
    Gui, %Label%:Show, x%X% y%Y% NoActivate, %Label%
}

crosshairGUIMove(X,Y)
{
	;~ global CrosshairLIndex
	WinMove, Crs1,, %X%, %Y%
	WinMove, Crs2,, %X%, %Y%
	WinMove, Crs3,, %X%, %Y%
	WinMove, Crs4,, %X%, %Y%
	WinMove, Crs5,, %X%, %Y%
	WinMove, Crs0,, %X%, %Y%
	;~ Label := "Crs"
	;~ Label .= CrosshairLIndex - 1
    ;~ Gui, %Label%:Show, x%X% y%Y% NoActivate, %Label%
}

crosshairGUIRefresh(Picture, X, Y, Scale = 100)
{
	global CrosshairLIndex
	Label := "Crs"
	if(CrosshairLIndex = 1)
	{
		Clear := true
		CrosshairLIndex := 2
	}
	if(CrosshairLIndex > 1)
		Label .= CrosshairLIndex
    Gui, %Label%:Margin , 0, 0
    Gui, %Label%:Add, Picture, w%Scale% h%Scale%, %Picture%
    Gui, %Label%:Color, ECE9D8
    Gui, %Label%:+LastFound -Caption +AlwaysOnTop +ToolWindow -Border
    Winset, TransColor, ECE9D8 150
	WinSet,ExStyle,^0x20
    Gui, %Label%:Show, x%X% y%Y% NoActivate, %Label%
	if(CrosshairLIndex = 2 && Clear = true)
	{
		Label := "Crs4"
		Gui, %Label%:Show, Hide, %Label%
		Gui, %Label%:Destroy
		CrosshairLIndex := 2
	}
	else if(Label > 1)
	{
		Label := "Crs"
		Label .= CrosshairLIndex - 1
		Gui, %Label%:Show, Hide, %Label%
		Gui, %Label%:Destroy
	}
	if(CrosshairLIndex >= 4)
		CrosshairLIndex := 1
	else
	CrosshairLIndex++
}

crosshairRotate()
{
	global CH_Height
	MouseGetPos, MouseX, MouseY
	WinGetPos, WinX, WinY, WinW, WinH, Guild Wars 2
	WinCenterX := WinW/2
	WinCenterY := WinH/2 + CH_Height
	deltaY := MouseY - WinCenterY
	deltaX := MouseX - WinCenterX
	angleInDegrees := ATan(deltaY / deltaX) * 57.29578 + 90
	if(MouseX < WinCenterX)
	{
		angleInDegrees += 180
	}
	ClosestDist := ""
	if(angleInDegrees < 11.25 or angleInDegrees > 348.75)
	{
		ClosestDist := "TM"
	}
	if(angleInDegrees < 33.75 && angleInDegrees > 11.25)
	{
		ClosestDist := "TM1"
	}
	if(angleInDegrees < 56.25 && angleInDegrees > 33.75)
	{
		ClosestDist := "TR"
	}
	if(angleInDegrees < 78.75 && angleInDegrees > 56.25)
	{
		ClosestDist := "TR1"
	}
	if(angleInDegrees < 101.25 && angleInDegrees > 78.75)
	{
		ClosestDist := "RM"
	}
	if(angleInDegrees < 123.75 && angleInDegrees > 101.25)
	{
		ClosestDist := "RM1"
	}
	if(angleInDegrees < 146.25 && angleInDegrees > 123.75)
	{
		ClosestDist := "BR"
	}
	if(angleInDegrees < 168.75 && angleInDegrees > 146.25)
	{
		ClosestDist := "BR1"
	}
	if(angleInDegrees < 191.25 && angleInDegrees > 168.75)
	{
		ClosestDist := "BM"
	}
	if(angleInDegrees < 213.75 && angleInDegrees > 191.25)
	{
		ClosestDist := "BM1"
	}
	if(angleInDegrees < 236.25 && angleInDegrees > 213.75)
	{
		ClosestDist := "BL"
	}
	if(angleInDegrees < 258.75 && angleInDegrees > 236.25)
	{
		ClosestDist := "BL1"
	}
	if(angleInDegrees < 281.25 && angleInDegrees > 258.75)
	{
		ClosestDist := "LM"
	}
	if(angleInDegrees < 303.75 && angleInDegrees > 281.25)
	{
		ClosestDist := "LM1"
	}
	if(angleInDegrees < 326.25 && angleInDegrees > 303.75)
	{
		ClosestDist := "TL"
	}
	if(angleInDegrees < 348.75 && angleInDegrees > 326.25)
	{
		ClosestDist := "TL1"
	}
	return {closestDist:ClosestDist}
}

crosshairGUIClose()
{
	Gui, Crs0:Destroy
	Gui, Crs1:Destroy
	Gui, Crs2:Destroy
	Gui, Crs3:Destroy
	Gui, Crs4:Destroy
	Gui, Crs5:Destroy
}

;RubberMouse(true/false) turns Rubber Mouse on or off, RubberMouse(!RubberMouse) Automatically toggles on or off
;RubberMouseEnable() Manually enables Rubber Mouse
;RubberMouseDisable() Manually disables Rubber Mouse
;RubberSetElas(6) Sets the Elasticity for the Rubber Formula
;RubberSetDistance(0.1) Set the amount the move variable is multiplied by. range 0-1
;

RubberMouse(on := true)
{
    global 
    if(on && !RubberMouseOn)
    {
        RubberMouseEnable()
    }
    else if(RubberMouseOn && !on)
    {
        RubberMouseDisable()
    }
}

RubberMouseEnable()
{
    global
    if(RubberMouseOn)
        return
    MouseGetPos, RubberStartx, RubberStarty
    SetTimer, RubberMouse, Off
    SetTimer, RubberMouse, 0
}

RubberSetElas(Elas)
{
    global RubberElasticity
    RubberElasticity := Elas
}

RubberSetDistance(Distance)
{
    global MouseDistance
    MouseDistance := Distance
}

RubberMouseCoreProccess()
{
    global
    RubberMouseOn := true
    MouseGetPos, RubberCurX, RubberCurY
    if((RubberStartx<>RubberCurX) || (RubberStarty<>RubberCurY))
    {
        tmpX := (RubberStartx - RubberCurX) / RubberElasticity
        tmpY := (RubberStarty - RubberCurY) / RubberElasticity
        tmpAvg := (Abs(tmpX)+Abs(tmpY))/2
        MSpeed := (reverseRange(scaleRange(tmpAvg))) * MouseDistance
        if(MSpeed < 0)
            MSpeed := 0
        MouseMove, %tmpX%, %tmpY%, %MSpeed%, R
    }
}

RubberMouseDisable()
{
    global RubberMouseOn
    if(!RubberMouseOn)
        return
    RubberMouseOn := false
    SetTimer, RubberMouse, Off
}

scaleRange(input, scale = 50, min = 0, max = 400)
{
    return ((input/max) + (min/max))*scale
}

reverseRange(input, min = 0, max = 10)
{
    return (max + min) - input
}

read()
{
	global
	IniRead, Inventory_Key, 	%settings%, Shortcuts, 		Inventory, i
	IniRead, Map_Key, 			%settings%, Shortcuts, 		Map, m
	IniRead, Hero_Key, 			%settings%, Shortcuts, 		Hero, h
	IniRead, Guild_Key, 		%settings%, Shortcuts, 		Guild, g
	IniRead, Trade_Key, 		%settings%, Shortcuts, 		Trade, o
	IniRead, Wvw_Key, 			%settings%, Shortcuts, 		WvW, b
	IniRead, Social_Key, 		%settings%, Shortcuts, 		Social, y
	IniRead, Escape_Key, 		%settings%, Shortcuts, 		Esc, Esc
	IniRead, Command_Key, 		%settings%, Shortcuts, 		SlashCommands, /
	IniRead, Reply_Key, 		%settings%, Shortcuts, 		Reply, BS
	IniRead, Chat_Key, 			%settings%, Shortcuts, 		Chat, Enter
	IniRead, Invite_Key, 		%settings%, Shortcuts, 		Party, p
	IniRead, CH_Height, 		%settings%, Crosshair, 		Height, -33
	IniRead, CrosshairScale, 	%settings%, Crosshair, 		Scale, 100
	IniRead, CrosshairImage, 	%settings%, Crosshair, 		Image, Crosshair.png
	IniRead, Elasticity, 		%settings%, Crosshair, 		Elasticity, 6
	IniRead, MouseDistance, 	%settings%, Crosshair, 		MouseDistance, 0.001
	IniRead, TargetKey, 		%settings%, Hotkeys, 		TargetKey, U
	IniRead, LMBEvent, 			%settings%, Hotkeys, 		LeftClick, 1
	IniRead, RMBEvent, 			%settings%, Hotkeys, 		RightClick, 2
	IniRead, WheelUpEvent, 		%settings%, Hotkeys, 		MouseWheelUp, PgUp
	IniRead, WheelDownEvent, 	%settings%, Hotkeys, 		MouseWheelDown, PgDn
	IniRead, MMBEvent, 			%settings%, Hotkeys, 		WheelClick, MButton
	IniRead, MB4Event, 			%settings%, Hotkeys,	 	MouseButton4, XButton1
	IniRead, MB5Event, 			%settings%, Hotkeys, 		MouseButton5, XButton2
	IniRead, OneKey, 			%settings%, Hotkeys, 		1Key, 1
	IniRead, OneEvent, 			%settings%, Hotkeys, 		1Event, 1
	IniRead, TwoKey, 			%settings%, Hotkeys, 		2Key, 2
	IniRead, TwoEvent, 			%settings%, Hotkeys, 		2Event, 2
	IniRead, ThreeKey, 			%settings%, Hotkeys, 		3Key, 3
	IniRead, ThreeEvent, 		%settings%, Hotkeys, 		3Event, 3
	IniRead, FourKey, 			%settings%, Hotkeys, 		4Key, 4
	IniRead, FourEvent, 		%settings%, Hotkeys, 		4Event, 4
	IniRead, FiveKey, 			%settings%, Hotkeys, 		5Key, 5
	IniRead, FiveEvent, 		%settings%, Hotkeys, 		5Event, 5
	IniRead, SixKey, 			%settings%, Hotkeys, 		6Key, 6
	IniRead, SixEvent, 			%settings%, Hotkeys, 		6Event, 6
	IniRead, SevenKey, 			%settings%, Hotkeys, 		7Key, 7
	IniRead, SevenEvent, 		%settings%, Hotkeys, 		7Event, 7
	IniRead, EightKey, 			%settings%, Hotkeys, 		8Key, 8
	IniRead, EightEvent, 		%settings%, Hotkeys, 		8Event, 8
	IniRead, NineKey, 			%settings%, Hotkeys, 		9Key, 9
	IniRead, NineEvent, 		%settings%, Hotkeys, 		9Event, 9
	IniRead, TenKey, 			%settings%, Hotkeys, 		0Key, 0
	IniRead, TenEvent, 			%settings%, Hotkeys, 		0Event, 0
	IniRead, ToggleKey, 		%settings%, Hotkeys, 		ToggleKey, Alt
	IniRead, FOneKey, 			%settings%, Hotkeys, 		F1Key, F1
	IniRead, FOneEvent, 		%settings%, Hotkeys, 		F1Event, F1
	IniRead, FTwoKey, 			%settings%, Hotkeys, 		F2Key, F2
	IniRead, FTwoEvent, 		%settings%, Hotkeys, 		F2Event, F2
	IniRead, FThreeKey, 		%settings%, Hotkeys, 		F3Key, F3
	IniRead, FThreeEvent, 		%settings%, Hotkeys, 		F3Event, F3
	IniRead, FFourKey, 			%settings%, Hotkeys, 		F4Key, F4
	IniRead, FFourEvent, 		%settings%, Hotkeys, 		F4Event, F4
	IniRead, NoLockKey, 		%settings%, Hotkeys, 		NoLockKey, q
	IniRead, NoLockEvent, 		%settings%, Hotkeys, 		NoLockEvent, q
	IniRead, NoLockKey2, 		%settings%, Hotkeys, 		NoLockKey2, F5
	IniRead, NoLockEvent2, 		%settings%, Hotkeys, 		NoLockEvent2, F5
	IniRead, NoLockKey3, 		%settings%, Hotkeys, 		NoLockKey3, F6
	IniRead, NoLockEvent3, 		%settings%, Hotkeys, 		NoLockEvent3, F6
	IniRead, tmpLMBTarget, 		%settings%, RequiresTarget, LeftClick, 0
	IniRead, tmpRMBTarget, 		%settings%, RequiresTarget, RightClick, 0
	IniRead, tmpMWUTarget, 		%settings%, RequiresTarget, WheelUp, 0
	IniRead, tmpMWDTarget,	 	%settings%, RequiresTarget, WheelDown, 0
	IniRead, tmpMMBTarget, 		%settings%, RequiresTarget, WheelClick, 0
	IniRead, tmpMB4Target, 		%settings%, RequiresTarget, MouseButton4, 0
	IniRead, tmpMB5Target, 		%settings%, RequiresTarget, MouseButton5, 0
	IniRead, tmpOneTarget, 		%settings%, RequiresTarget, 1, 0
	IniRead, tmpTwoTarget, 		%settings%, RequiresTarget, 2, 0
	IniRead, tmpThreeTarget, 	%settings%, RequiresTarget, 3, 0
	IniRead, tmpFourTarget, 	%settings%, RequiresTarget, 4, 0
	IniRead, tmpFiveTarget, 	%settings%, RequiresTarget, 5, 0
	IniRead, tmpSixTarget, 		%settings%, RequiresTarget, 6, 0
	IniRead, tmpSevenTarget, 	%settings%, RequiresTarget, 7, 0
	IniRead, tmpEightTarget, 	%settings%, RequiresTarget, 8, 0
	IniRead, tmpNineTarget, 	%settings%, RequiresTarget, 9, 0
	IniRead, tmpTenTarget, 		%settings%, RequiresTarget, 0, 0
	IniRead, tmpFOneTarget, 	%settings%, RequiresTarget, F1, 0
	IniRead, tmpFTwoTarget, 	%settings%, RequiresTarget, F2, 0
	IniRead, tmpFThreeTarget, 	%settings%, RequiresTarget, F3, 0
	IniRead, tmpFFourTarget, 	%settings%, RequiresTarget, F4, 0
	IniRead, tmpNoLockTarget, 	%settings%, RequiresTarget, q, 0
	IniRead, tmpNoLockTarget2, 	%settings%, RequiresTarget, F5, 0
	IniRead, tmpNoLockTarget3, 	%settings%, RequiresTarget, F6, 0
}