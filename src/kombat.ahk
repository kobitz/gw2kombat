#SingleInstance force
#InstallKeybdHook
#InstallMouseHook
#MaxHotkeysPerInterval 1000
#Include Functions.ahk
#Include TTS.ahk
#IfWinActive Guild Wars 2

if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   ExitApp
}


Menu, Tray, NoStandard
Menu, Tray, Icon, kombat.ico
Menu, Tray, Add, Settings, _settings
Menu, Tray, Add, Exit, _exit
Menu, Tray, Default, Settings
onexit _exit

;~ SendMode Input
SetMouseDelay, -1
SetKeyDelay, -1
SetWinDelay, -1

;G_Language("en")
;G_TranslateTo("ja")
;G_Translate(input)
;G_TTS(input)
G_TTS("Online")

settings = settings.ini

read()

RubberMouseOn := false
RubberElasticity = %Elasticity%

AltBind := CtrlBind := ShiftBind := false

locked := 0
NoLockPressed := 0

Hotkey, IfWinActive,    Guild Wars 2
Hotkey, %Inventory_Key%,inventory
Hotkey, %Map_Key%,      map
Hotkey, %Hero_Key%,     hero
Hotkey, %Guild_Key%,    guild
Hotkey, %Trade_Key%,    trade
Hotkey, %Wvw_Key%,      wvw
Hotkey, %Social_Key%,   social
Hotkey, %Escape_Key%,   escape
Hotkey, %Command_Key%,  command
Hotkey, %Reply_Key%,    reply
Hotkey, %Chat_Key%,     chat
Hotkey, %Invite_Key%,   invite

;-------------------------------Hotkeys-------------------------------------
bind( ToggleKey , "toggler"  )
bind("*LButton"  , "LMB"     )
;~ bind("+LButton" , "ShiftLMB")
;~ bind("!LButton" , "AltLMB"  )
;~ bind("^LButton" , "CtrlLMB" )
bind("RButton"  , "RMB"     )
bind("+RButton" , "ShiftRMB")
bind("!RButton" , "AltRMB"  )
bind("^RButton" , "CtrlRMB" )
bind("WheelUp"  , "MWU"     )
;~ bind("+WheelUp" , "ShiftMWU")
;~ bind("!WheelUp" , "AltMWU"  )
;~ bind("^WheelUp" , "CtrlMWU" )
bind("WheelDown", "MWD"     )
;~ bind("+WheelDown" , "ShiftMWD")
;~ bind("!WheelDown" , "AltMWD"  )
;~ bind("^WheelDown" , "CtrlMWD" )
bind("MButton"  , "MMB"     )
bind("XButton1" , "MB4"     )
bind("XButton2" , "MB5"     )
bind(OneKey     , "one"     )
bind(TwoKey     , "two"     )
bind(ThreeKey   , "three"   )
bind(FourKey    , "four"    )
bind(FiveKey    , "five"    )
bind(SixKey     , "six"     )
bind(SevenKey   , "seven"   )
bind(EightKey   , "eight"   )
bind(NineKey    , "nine"    )
bind(TenKey     , "ten"     )
bind(FOneKey    , "prof1"   )
bind(FTwoKey    , "prof2"   )
bind(FThreeKey  , "prof3"   )
bind(FFourKey   , "prof4"   )
bind(NoLockKey  , "noLock"  )
bind(NoLockKey2 , "noLock2" )
bind(NoLockKey3 , "noLock3" )
return

~$Alt::
    if(AltBind)
    {
        gosub, %AltSub%
    }
return

~$Ctrl::
    if(CtrlBind)
    {
        gosub, %CtrlSub%
    }
return

~$Shift::
    if(ShiftBind)
    {
        gosub, %ShiftSub%
    }
return

LMB:
key("LButton", LMBEvent, tmpLMBTarget)
return

;~ ShiftLMB:
;~ key("+LButton", LMBEvent, tmpLMBTarget)
;~ return

;~ AltLMB:
;~ key("!LButton", LMBEvent, tmpLMBTarget)
;~ return

;~ CtrlLMB:
;~ key("^LButton", LMBEvent, tmpLMBTarget)
;~ return

RMB:
key("RButton", RMBEvent, tmpRMBTarget)
return

ShiftRMB:
key("+RButton", RMBEvent, tmpRMBTarget)
return

AltRMB:
key("!RButton", RMBEvent, tmpRMBTarget)
return

CtrlRMB:
key("^RButton", RMBEvent, tmpRMBTarget)
return

MWU:
key("WheelUp", WheelUpEvent, tmpMWUTarget)
return

;~ ShiftMWU:
;~ key("+WheelUp", WheelUpEvent, tmpMWUTarget)
;~ return

;~ AltMWU:
;~ key("!WheelUp", WheelUpEvent, tmpMWUTarget)
;~ return

;~ CtrlMWU:
;~ key("^WheelUp", WheelUpEvent, tmpMWUTarget)
;~ return

MWD:
key("WheelDown", WheelDownEvent, tmpMWDTarget)
return

;~ ShiftMWD:
;~ key("+WheelDown", *WheelDownEvent, tmpMWDTarget)
;~ return

;~ AltMWD:
;~ key("!WheelDown", WheelDownEvent, tmpMWDTarget)
;~ return

;~ CtrlMWD:
;~ key("^WheelDown", WheelDownEvent, tmpMWDTarget)
;~ return

MMB:
key("MButton", MMBEvent, tmpMMBTarget)
return

MB4:
key("XButton1", MB4Event, tmpMB4Target)
return

MB5:
key("XButton2", MB5Event, tmpMB5Target)
return

one:
key(OneKey, OneEvent, tmpOneTarget)
return

two:
key(TwoKey, TwoEvent, tmpTwoTarget)
return

three:
key(ThreeKey, ThreeEvent, tmpThreeTarget)
return

four:
key(FourKey, FourEvent, tmpFourTarget)
return

five:
key(FiveKey, FiveEvent, tmpFiveTarget)
return

six:
key(SixKey, SixEvent, tmpSixTarget)
return

seven:
key(SevenKey, SevenEvent, tmpSevenTarget)
return

eight:
key(EightKey, EightEvent, tmpEightTarget)
return

nine:
key(NineKey, NineEvent, tmpNineTarget)
return

ten:
key(TenKey, TenEvent, tmpTenTarget)
return

prof1:
key(FOneKey, FOneEvent, tmpFOneTarget)
return

prof2:
key(FTwoKey, FTwoEvent, tmpFTwoTarget)
return

prof3:
key(FThreeKey, FThreeKey, tmpFThreeTarget)
return

prof4:
key(FFourKey, FFourEvent, tmpFFourTarget)
return

noLock:
noLockKey(NoLockKey, NoLockEvent, tmpNoLockTarget)
return

noLock2:
noLockKey(NoLockKey2, NoLockEvent2, tmpNoLockTarget2)
return

noLock3:
noLockKey(NoLockKey3, NoLockEvent3, tmpNoLockTarget3)
return

;---------------------------------------------------------------------------

crosshairMover:
if (locked == 1)
{
  MouseGetPos, MouseX, MouseY
  WinGetPos, WinX, WinY, WinW, WinH, Guild Wars 2
  global CH_Height, NoLockPressed
  WinCenterX := WinW/2
  WinCenterY := WinH/2 + CH_Height
  distX := (WinCenterX - MouseX)
  distY := (WinCenterY - MouseY)
  tmp := CrosshairScale/2
  tmpx := (MouseX + WinX - tmp) - (distX * MouseDistance)
  tmpy := (MouseY + WinY - tmp) - (distY * MouseDistance)
  CR := crosshairRotate()
  crosshairRotate()
  if(CR.closestDist != lastCrosshairDist && NoLockPressed = 0)
  {
    lastCrosshairDist := CR.closestDist
    CrsImage = crosshairs\%lastCrosshairDist%\%CrosshairImage%
    crosshairGUIRefresh(CrsImage, tmpx, tmpy, CrosshairScale)
  }
  else
    crosshairGUIMove(tmpx,tmpy)
}
return

RubberMouse:
RubberMouseCoreProccess()
return

toggler:
if (locked == 0)
{
  locked := 1
  mouseCenterLock()
  RubberMouse(true)
  CrsImage = crosshairs\%CrosshairImage%
  SetTimer, crosshairMover, 0
  Send, {%TargetKey% Down}
  G_TTS("locked")
}
else
{
  locked := 0
  RubberMouse(false)
  crosshairGUIClose()
  SetTimer, crosshairMover, Off
  Send, {RButton Up}
  Send, {%TargetKey% Up}
  G_TTS("free")
 }
return


; Alt+Tab
~!TAB::
  locked := false
  RubberMouse(false)
  crosshairGUIClose()
  Send, {RButton Up}
  Send, {LAlt Down}{Tab}
  KeyWait, LAlt
  Send, {LAlt Up}
return

; Ctrl+Alt+Del
~^!DEL::
  locked := false
  RubberMouse(false)
  crosshairGUIClose()
  Send, {RButton Up}
return

~LWin::
  locked := false
  RubberMouse(false)
  crosshairGUIClose()
  Send, {RButton Up}
  Send, {LWin}
return

~RWin::
  locked := false
  RubberMouse(false)
  crosshairGUIClose()
  Send, {RButton Up}
  Send, {RWin}
return

~#::
  locked := false
  RubberMouse(false)
  crosshairGUIClose()
  Send, {RButton Up}
  Send, {#}
return

inventory:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Inventory_Key%}
  return
}
  Send, {%Inventory_Key%}
  return

map:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Map_Key%}
Return
}
  Send, {%Map_Key%}
Return

hero:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Hero_Key%}
Return
}
  Send, {%Hero_Key%}
Return

guild:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Guild_Key%}
Return
}
  Send, {%Guild_Key%}
Return

trade:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Trade_Key%}
Return
}
  Send, {%Trade_Key%}
Return

wvw:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Wvw_Key%}
Return
}
  Send, {%Wvw_Key%}
Return

social:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Social_Key%}
Return
}
  Send, {%Social_Key%}
Return

escape:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Escape_Key%}
Return
}
  Send, {%Escape_Key%}
Return

command:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Command_Key%}
Return
}
  Send, {%Command_Key%}
Return

reply:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Reply_Key%}
Return
}
  Send, {%Reply_Key%}
Return

chat:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Chat_Key%}
Return
}
  Send, {%Chat_Key%}
Return

invite:
if (locked == 1)
{
  crosshairGUIClose()
  locked := 0
  RubberMouse(false)
  Send, {RButton Up}
  Send, {%Invite_Key%}
Return
}
  Send, {%Invite_Key%}
Return

_settings:
Run, Settings.ahk
return

_exit:
process, Close, Settings.ahk
exitApp