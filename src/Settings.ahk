#SingleInstance force
#NoTrayIcon
#Include Functions.ahk

Menu, Tray, Icon, kombat.ico

if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   ExitApp
}

settings = settings.ini

read()

LMBTarget := RMBTarget := MWUTarget := MWDTarget := MMBTarget := MB4Target := MB5Target := OneTarget := TwoTarget := ThreeTarget := FourTarget := FiveTarget := SixTarget := SevenTarget := EightTarget := NineTarget := TenTarget := FOneTarget := FTwoTarget := FThreeTarget := FFourTarget := NoLockTarget := ""

if(tmpRMBTarget)
   RMBTarget := "Checked"
if(tmpLMBTarget)
   LMBTarget := "Checked"
if(tmpMWUTarget)
   MWUTarget := "Checked"
if(tmpMWDTarget)
   MWDTarget := "Checked"
if(tmpMMBTarget)
   MMBTarget := "Checked"
if(tmpMB4Target)
   MB4Target := "Checked"
if(tmpMB5Target)
   MB5Target := "Checked"
if(tmpOneTarget)
   OneTarget := "Checked"
if(tmpTwoTarget)
   TwoTarget := "Checked"
if(tmpThreeTarget)
   ThreeTarget := "Checked"
if(tmpFourTarget)
   FourTarget := "Checked"
if(tmpFiveTarget)
   FiveTarget := "Checked"
if(tmpSixTarget)
   SixTarget := "Checked"
if(tmpSevenTarget)
   SevenTarget := "Checked"
if(tmpEightTarget)
   EightTarget := "Checked"
if(tmpNineTarget)
   NineTarget := "Checked"
if(tmpTenTarget)
   TenTarget := "Checked"
if(tmpFOneTarget)
   FOneTarget := "Checked"
if(tmpFTwoTarget)
   FTwoTarget := "Checked"
if(tmpFThreeTarget)
   FThreeTarget := "Checked"
if(tmpFFourTarget)
   FFourTarget := "Checked"
if(tmpNoLockTarget)
   NoLockTarget := "Checked"

crosshairList := ""
Loop, crosshairs\*.png, 0, 1
{
   crosshairList .= A_LoopFileName . "|"
}

height = 21
width  = 50


col1  = 20
col2 := col1 + width + 20
col3 := col2 + width + 10
col4 := col3 + width - 25 + 10
col5 := col4 + width + 20
col6 := col5 + width + 10
col7 := col6 + width - 25 + 10
col8 := col7 + width + 20
col9 := col8 + width + 10
col0 := col9 + width - 30 + 10

mod4 := col4 + 30 + 10
mod5 := col4 + 60 + 10
mod6 := col4 + 15 + 10

row1   = 20
row2  := row1  + height + 10
row3  := row2  + height + 10
row4  := row3  + height + 10
row5  := row4  + height + 10
row6  := row5  + height
row7  := row6  + height + 10
row8  := row7  + height + 10
row9  := row8  + height + 10
row10 := row9  + height + 10
row11 := row10 + height + 10
row12 := row11 + height + 10
row13 := row12 + height + 10
row14 := row13 + height + 10
row15 := row14 + height + 10
row16 := row15 + height + 10


low1   = 25
low2  := row1  + height + 15
low3  := row2  + height + 15
low4  := row3  + height + 15
low10 := row9  + height + 15
low11 := row10 + height + 15
low12 := row11 + height + 15
low6  := row5  + height + 15

mow11 := row11 + 1

Gui, Add, Slider,       x%col0% y%row1%  w%height% h220       vCrosshairSlider  gCrosshairSliderChange    AltSubmit  Range-100-100 Vertical Left NoTicks, 0
Gui, Add, Slider,       x%col6% y%row10% w180      h%height%  vCrosshairScaleSlider gCrosshairScaleChange AltSubmit  Range25-250 Left NoTicks, 100
Gui, Add, Slider,       x%col6% y%row11% w180      h%height%  vElasticitySlider gElasticitySliderChange AltSubmit Range10-500 Left NoTicks, 1
Gui, Add, Slider,       x%col6% y%row12% w180      h%height%  vMouseDistanceSlider gMouseDistanceSliderChange AltSubmit Range1-2500 Left NoTicks, 1
Gui, Add, DropDownList, x%col7% y%row8%  w120      h100       vCrosshairImage   gCrosshairImageChange, %crosshairList%
Gui, Add, Text,         x%col1% y%low1%  w%width%  h%height%                                      , LeftClick
Gui, Add, Text,         x%col1% y%low2%  w%width%  h%height%                                      , RightClick
Gui, Add, Text,         x%col1% y%low3%  w%width%  h%height%                                      , WheelUp
Gui, Add, Text,         x%col1% y%low4%  w%width%  h%height%                                      , WheelDn
Gui, Add, Text,         x%col1% y%row5%  w70       h%height%                                      , Basic Hotkeys
Gui, Add, Hotkey,       x%col1% y%row6%  w%width%  h%height%  vOneKey           gOneKeyChange     , %OneKey%
Gui, Add, Hotkey,       x%col1% y%row7%  w%width%  h%height%  vTwoKey           gTwoKeyChange     , %TwoKey%
Gui, Add, Hotkey,       x%col1% y%row8%  w%width%  h%height%  vThreeKey         gThreeKeyChange   , %ThreeKey%
Gui, Add, Hotkey,       x%col1% y%row9%  w%width%  h%height%  vFourKey          gFourKeyChange    , %FourKey%
Gui, Add, Hotkey,       x%col1% y%row10% w%width%  h%height%  vFiveKey          gFiveKeyChange    , %FiveKey%
Gui, Add, Hotkey,       x%col2% y%row1%  w%width%  h%height%  vLMBEvent         gLMBEventChange   , %LMBEvent%
Gui, Add, Hotkey,       x%col2% y%row2%  w%width%  h%height%  vRMBEvent         gRMBEventChange   , %RMBEvent%
Gui, Add, Hotkey,       x%col2% y%row3%  w%width%  h%height%  vMWUEvent         gMWUEventChange   , %WheelUpEvent%
Gui, Add, Hotkey,       x%col2% y%row4%  w%width%  h%height%  vMWDEvent         gMWDEventChange   , %WheelDownEvent%
Gui, Add, Hotkey,       x%col2% y%row6%  w%width%  h%height%  vOneEvent         gOneEventChange   , %OneEvent%
Gui, Add, Hotkey,       x%col2% y%row7%  w%width%  h%height%  vTwoEvent         gTwoEventChange   , %TwoEvent%
Gui, Add, Hotkey,       x%col2% y%row8%  w%width%  h%height%  vThreeEvent       gThreeEventChange , %ThreeEvent%
Gui, Add, Hotkey,       x%col2% y%row9%  w%width%  h%height%  vFourEvent        gFourEventChange  , %FourEvent%
Gui, Add, Hotkey,       x%col2% y%row10% w%width%  h%height%  vFiveEvent        gFiveEventChange  , %FiveEvent%
Gui, Add, CheckBox,     x%col3% y%row1%  w%height% h%height%  vLMBTargetTrue    gToggle %LMBTarget%
Gui, Add, CheckBox,     x%col3% y%row2%  w%height% h%height%  vRMBTargetTrue    gToggle %RMBTarget%
Gui, Add, CheckBox,     x%col3% y%row3%  w%height% h%height%  vMWUTargetTrue    gToggle %MWUTarget%
Gui, Add, CheckBox,     x%col3% y%row4%  w%height% h%height%  vMWDTargetTrue    gToggle %MWDTarget%
Gui, Add, CheckBox,     x%col3% y%row6%  w%height% h%height%  vOneTargetTrue    gToggle %OneTarget%
Gui, Add, CheckBox,     x%col3% y%row7%  w%height% h%height%  vTwoTargetTrue    gToggle %TwoTarget%
Gui, Add, CheckBox,     x%col3% y%row8%  w%height% h%height%  vThreeTargetTrue  gToggle %ThreeTarget%
Gui, Add, CheckBox,     x%col3% y%row9%  w%height% h%height%  vFourTargetTrue   gToggle %FourTarget%
Gui, Add, CheckBox,     x%col3% y%row10% w%height% h%height%  vFiveTargetTrue   gToggle %FiveTarget%
Gui, Add, Text,         x%col4% y%row5%  w95       h%height%                                      , Profession Hotkeys
Gui, Add, Hotkey,       x%col4% y%row6%  w%width%  h%height%  vFOneKey          gFOneKeyChange    , %FOneKey%
Gui, Add, Hotkey,       x%col4% y%row7%  w%width%  h%height%  vFTwoKey          gFTwoKeyChange    , %FTwoKey%
Gui, Add, Hotkey,       x%col4% y%row8%  w%width%  h%height%  vFThreeKey        gFThreeKeyChange  , %FThreeKey%
Gui, Add, Hotkey,       x%col4% y%row9%  w%width%  h%height%  vFFourKey         gFFourKeyChange   , %FFourKey%
Gui, Add, Text,         x30 y%low11% w100  h%height%                                      , LockAutoTargetKey
Gui, Add, Text,         x%col1% y%row12% w160  h42                                      , Checked Boxes will initiate holding this button down.
Gui, Add, Text,         x%col4% y%row1%  w%width%  h%height%                                      , Mouse4
Gui, Add, Text,         x%col4% y%row2%  w%width%  h%height%                                      , Mouse5
Gui, Add, Text,         x%col4% y%row3%  w60  h%height%                                      , WheelClick
Gui, Add, Text,         x%col4% y%row4%  w%width%  h%height%                                      , Toggle
Gui, Add, Text,         x%mod4% y%low10%  w80  h%height%                                      , Crosshair Scale:
Gui, Add, Text,         x%mod5% y%low11%  w55  h%height%                                      , Elasticity:
Gui, Add, Text,         x%mod6% y%low12%  w100  h%height%                                      , Crosshair Distance:
Gui, Add, Hotkey,       x%col5% y%row1%  w%width%  h%height%  vMB4Event         gMB4EventChange   , %MB4Event%
Gui, Add, Hotkey,       x%col5% y%row2%  w%width%  h%height%  vMB5Event         gMB5EventChange   , %MB5Event%
Gui, Add, Hotkey,       x%col5% y%row3%  w%width%  h%height%  vMMBEvent         gMMBEventChange   , %MMBEvent%
Gui, Add, Hotkey,       x%col5% y%row4%  w%width%  h%height%  vToggleKey        gToggleKeyChange  , %ToggleKey%
Gui, Add, Hotkey,       x%col5% y%row6%  w%width%  h%height%  vFOneEvent        gFOneEventChange  , %FOneEvent%
Gui, Add, Hotkey,       x%col5% y%row7%  w%width%  h%height%  vFTwoEvent        gFTwoEventChange  , %FTwoEvent%
Gui, Add, Hotkey,       x%col5% y%row8%  w%width%  h%height%  vFThreeEvent      gFThreeEventChange, %FThreeEvent%
Gui, Add, Hotkey,       x%col5% y%row9%  w%width%  h%height%  vFFourEvent       gFFourEventChange , %FFourEvent%
Gui, Add, Hotkey,       x%col3% y%row11% w%width%  h%height%  vTargetKey        gTargetKeyChange  , %TargetKey%
Gui, Add, CheckBox,     x%col6% y%row1%  w%height% h%height%  vMB4TargetTrue    gToggle %MB4Target%
Gui, Add, CheckBox,     x%col6% y%row2%  w%height% h%height%  vMB5TargetTrue    gToggle %MB5Target%
Gui, Add, CheckBox,     x%col6% y%row3%  w%height% h%height%  vMMBTargetTrue    gToggle %MMBTarget%
Gui, Add, CheckBox,     x%col6% y%row6%  w%height% h%height%  vFOneTargetTrue   gToggle %FOneTarget%
Gui, Add, CheckBox,     x%col6% y%row7%  w%height% h%height%  vFTwoTargetTrue   gToggle %FTwoTarget%
Gui, Add, CheckBox,     x%col6% y%row8%  w%height% h%height%  vFThreeTargetTrue gToggle %FThreeTarget%
Gui, Add, CheckBox,     x%col6% y%row9%  w%height% h%height%  vFFourTargetTrue  gToggle %FFourTarget%
Gui, Add, Hotkey,       x%col7% y%row1%  w%width%  h%height%  vSixKey           gSixKeyChange     , %SixKey%
Gui, Add, Hotkey,       x%col7% y%row2%  w%width%  h%height%  vSevenKey         gSevenKeyChange   , %SevenKey%
Gui, Add, Hotkey,       x%col7% y%row3%  w%width%  h%height%  vEightKey         gEightKeyChange   , %EightKey%
Gui, Add, Hotkey,       x%col7% y%row4%  w%width%  h%height%  vNineKey          gNineKeyChange    , %NineKey%
Gui, Add, Hotkey,       x%col7% y%row5%  w%width%  h%height%  vTenKey           gTenKeyChange     , %TenKey%
Gui, Add, Text,         x%col7% y%low6%  w100      h%height%                                      , v No Lock Key v
Gui, Add, Hotkey,       x%col7% y%row7%  w%width%  h%height%  vNoLockKey        gNoLockKeyChange  , %noLockKey%
Gui, Add, Hotkey,       x%col8% y%row1%  w%width%  h%height%  vSixEvent         gSixEventChange   , %SixEvent%
Gui, Add, Hotkey,       x%col8% y%row2%  w%width%  h%height%  vSevenEvent       gSevenEventChange , %SevenEvent%
Gui, Add, Hotkey,       x%col8% y%row3%  w%width%  h%height%  vEightEvent       gEightEventChange , %EightEvent%
Gui, Add, Hotkey,       x%col8% y%row4%  w%width%  h%height%  vNineEvent        gNineEventChange  , %NineEvent%
Gui, Add, Hotkey,       x%col8% y%row5%  w%width%  h%height%  vTenEvent         gTenEventChange   , %TenEvent%
Gui, Add, Hotkey,       x%col8% y%row7%  w%width%  h%height%  vNoLockEvent      gNoLockEventChange, %noLockEvent%
Gui, Add, Button,       x%col8% y%row9%  w%width%  h%height%                    gApplySettings    , Apply
Gui, Add, CheckBox,     x%col9% y%row1%  w%height% h%height%  vSixTargetTrue    gToggle %SixTarget%
Gui, Add, CheckBox,     x%col9% y%row2%  w%height% h%height%  vSevenTargetTrue  gToggle %SevenTarget%
Gui, Add, CheckBox,     x%col9% y%row3%  w%height% h%height%  vEightTargetTrue  gToggle %EightTarget%
Gui, Add, CheckBox,     x%col9% y%row4%  w%height% h%height%  vNineTargetTrue   gToggle %NineTarget%
Gui, Add, CheckBox,     x%col9% y%row5%  w%height% h%height%  vTenTargetTrue    gToggle %TenTarget%
Gui, Add, CheckBox,     x%col9% y%row7%  w%height% h%height%  vNoLockTargetTrue gToggle %NoLockTarget%
Gui, Add, Text,         x%col0% y%row9%  w26 h%height%  vCrosshairSliderLabel, %CH_Height%
Gui, Add, Text,         x%col0% y%row10%  w26 h%height%  vCrosshairScaleLabel, %CrosshairScale%
Gui, Add, Text,         x%col0% y%row11%  w26 h%height%  vElasticitySliderLabel, %Elasticity%
Gui, Add, Text,         x%col0% y%row12%  w26 h%height%  vMouseDistanceSliderLabel, %MouseDistance%
GuiControl, ChooseString, CrosshairImage, %CrosshairImage%
Gui, Show, , kombat Settings
CrsImage = crosshairs/%CrosshairImage%
gosub, calcHeight
return


Toggle:
Gui, Submit, NoHide
IniWrite, %LMBTargetTrue%,    %settings%, RequiresTarget, LeftClick
IniWrite, %RMBTargetTrue%,    %settings%, RequiresTarget, RightClick
IniWrite, %MWUTargetTrue%,    %settings%, RequiresTarget, WheelUp
IniWrite, %MWDTargetTrue%,    %settings%, RequiresTarget, WheelDown
IniWrite, %MMBTargetTrue%,    %settings%, RequiresTarget, WheelClick
IniWrite, %MB4TargetTrue%,    %settings%, RequiresTarget, MouseButton4
IniWrite, %MB5TargetTrue%,    %settings%, RequiresTarget, MouseButton5
IniWrite, %OneTargetTrue%,    %settings%, RequiresTarget, 1
IniWrite, %TwoTargetTrue%,    %settings%, RequiresTarget, 2
IniWrite, %ThreeTargetTrue%,  %settings%, RequiresTarget, 3
IniWrite, %FourTargetTrue%,   %settings%, RequiresTarget, 4
IniWrite, %FiveTargetTrue%,   %settings%, RequiresTarget, 5
IniWrite, %SixTargetTrue%,    %settings%, RequiresTarget, 6
IniWrite, %SevenTargetTrue%,  %settings%, RequiresTarget, 7
IniWrite, %EightTargetTrue%,  %settings%, RequiresTarget, 8
IniWrite, %NineTargetTrue%,   %settings%, RequiresTarget, 9
IniWrite, %TenTargetTrue%,    %settings%, RequiresTarget, 0
IniWrite, %FOneTargetTrue%,   %settings%, RequiresTarget, F1
IniWrite, %FTwoTargetTrue%,   %settings%, RequiresTarget, F2
IniWrite, %FThreeTargetTrue%, %settings%, RequiresTarget, F3
IniWrite, %FFourTargetTrue%,  %settings%, RequiresTarget, F4
IniWrite, %NoLockTargetTrue%, %settings%, RequiresTarget, q
return

calcheight:
CoordMode, Mouse, Screen
MouseGetPos, MouseX, MouseY
CH := CH_Height + MouseY
CW := MouseX
Return

ToggleKeyChange:
Gui, Submit, Nohide
IniWrite, %ToggleKey%, %settings%, Hotkeys, ToggleKey

LMBEventChange:
Gui, Submit, NoHide
IniWrite, %LMBEvent%, %settings%, Hotkeys, LeftClick
return

RMBEventChange:
Gui, Submit, NoHide
IniWrite, %RMBEvent%, %settings%, Hotkeys, RightClick
return

MWUEventChange:
Gui, Submit, NoHide
IniWrite, %MWUEvent%, %settings%, Hotkeys, MouseWheelUp
return

MWDEventChange:
Gui, Submit, NoHide
IniWrite, %MWDEvent%, %settings%, Hotkeys, MouseWheelDown
return

MMBEventChange:
Gui, Submit, NoHide
IniWrite, %MMBEvent%, %settings%, Hotkeys, WheelClick
return

MB4EventChange:
Gui, Submit, NoHide
IniWrite, %MB4Event%, %settings%, Hotkeys, MouseButton4
return

MB5EventChange:
Gui, Submit, NoHide
IniWrite, %MB5Event%, %settings%, Hotkeys, MouseButton5
return

OneKeyChange:
Gui, Submit, NoHide
IniWrite, %OneKey%, %settings%, Hotkeys, 1Key
return

OneEventChange:
Gui, Submit, NoHide
IniWrite, %OneEvent%, %settings%, Hotkeys, 1Event
return

TwoKeyChange:
Gui, Submit, NoHide
IniWrite, %TwoKey%, %settings%, Hotkeys, 2Key
return

TwoEventChange:
Gui, Submit, NoHide
IniWrite, %TwoEvent%, %settings%, Hotkeys, 2Event
return

ThreeKeyChange:
Gui, Submit, NoHide
IniWrite, %ThreeKey%, %settings%, Hotkeys, 3Key
return

ThreeEventChange:
Gui, Submit, NoHide
IniWrite, %ThreeEvent%, %settings%, Hotkeys, 3Event
return

FourKeyChange:
Gui, Submit, NoHide
IniWrite, %FourKey%, %settings%, Hotkeys, 4Key
return

FourEventChange:
Gui, Submit, NoHide
IniWrite, %FourEvent%, %settings%, Hotkeys, 4Event
return

FiveKeyChange:
Gui, Submit, NoHide
IniWrite, %FiveKey%, %settings%, Hotkeys, 5Key
return

FiveEventChange:
Gui, Submit, NoHide
IniWrite, %FiveEvent%, %settings%, Hotkeys, 5Event
return

SixKeyChange:
Gui, Submit, NoHide
IniWrite, %SixKey%, %settings%, Hotkeys, 6Key
return

SixEventChange:
Gui, Submit, NoHide
IniWrite, %SixEvent%, %settings%, Hotkeys, 6Event
return

SevenKeyChange:
Gui, Submit, NoHide
IniWrite, %SevenKey%, %settings%, Hotkeys, 7Key
return

SevenEventChange:
Gui, Submit, NoHide
IniWrite, %SevenEvent%, %settings%, Hotkeys, 7Event
return

EightKeyChange:
Gui, Submit, NoHide
IniWrite, %EightKey%, %settings%, Hotkeys, 8Key
return

EightEventChange:
Gui, Submit, NoHide
IniWrite, %EightEvent%, %settings%, Hotkeys, 8Event
return

NineKeyChange:
Gui, Submit, NoHide
IniWrite, %NineKey%, %settings%, Hotkeys, 9Key
return

NineEventChange:
Gui, Submit, NoHide
IniWrite, %NineEvent%, %settings%, Hotkeys, 9Event
return

TenKeyChange:
Gui, Submit, NoHide
IniWrite, %TenKey%, %settings%, Hotkeys, 0Key
return

TenEventChange:
Gui, Submit, NoHide
IniWrite, %TenEvent%, %settings%, Hotkeys, 0Event
return

FOneKeyChange:
Gui, Submit, NoHide
IniWrite, %FOneKey%, %settings%, Hotkeys, F1Key
return

FOneEventChange:
Gui, Submit, NoHide
IniWrite, %FOneEvent%, %settings%, Hotkeys, F1Event
return

FTwoKeyChange:
Gui, Submit, NoHide
IniWrite, %FTwoKey%, %settings%, Hotkeys, F2Key
return

FTwoEventChange:
Gui, Submit, NoHide
IniWrite, %FTwoEvent%, %settings%, Hotkeys, F2Event
return

FThreeKeyChange:
Gui, Submit, NoHide
IniWrite, %FThreeKey%, %settings%, Hotkeys, F3Key
return

FThreeEventChange:
Gui, Submit, NoHide
IniWrite, %FThreeEvent%, %settings%, Hotkeys, F3Event
return

FFourKeyChange:
Gui, Submit, NoHide
IniWrite, %FFourKey%, %settings%, Hotkeys, F4Key
return

FFourEventChange:
Gui, Submit, NoHide
IniWrite, %FFourEvent%, %settings%, Hotkeys, F4Event
return

TargetKeyChange:
Gui, Submit, NoHide
IniWrite, %TargetKey%, setting.ini, Hotkeys, TargetKey
return

NoLockKeyChange:
Gui, Submit, NoHide
IniWrite, %OneKey%, %settings%, Hotkeys, 1Key
return

NoLockEventChange:
Gui, Submit, NoHide
IniWrite, %OneEvent%, %settings%, Hotkeys, 1Event
return

CrosshairSliderChange:
Gui, Submit, NoHide
CH_Height := CrosshairSlider
gosub, calcHeight
crosshairGUIClose()
crosshairGUI(CrsImage, CW, CH, CrosshairScale)
IniWrite, %CH_Height%, %settings%, Crosshair, Height
GuiControl,, CrosshairSliderLabel, % CH_Height
return

CrosshairScaleChange:
Gui, Submit, NoHide
CrosshairScale := CrosshairScaleSlider
gosub, calcHeight
crosshairGUIClose()
crosshairGUI(CrsImage, CW, CH, CrosshairScale)
IniWrite, %CrosshairScale%, %settings%, Crosshair, Scale
GuiControl,, CrosshairScaleLabel, % CrosshairScale
return

ElasticitySliderChange:
Gui, Submit, NoHide
Elasticity := ElasticitySlider / 10
RubberSetElas(Elasticity)
IniWrite, %Elasticity%, %settings%, Crosshair, Elasticity
GuiControl,, ElasticitySliderLabel, % Elasticity
return

MouseDistanceSliderChange:
Gui, Submit, NoHide
Distance := MouseDistanceSlider / 1000
RubberSetDistance(Distance)
IniWrite, %Distance%, %settings%, Crosshair, MouseDistance
GuiControl,, MouseDistanceSliderLabel, % Distance
return

CrosshairImageChange:
Gui, Submit, NoHide
CrsImage = crosshairs\%CrosshairImage%
crosshairGUIClose()
crosshairGUI(CrsImage, CW, CH, CrosshairScale)
IniWrite, %CrosshairImage%, %settings%, Crosshair, Image
return

ApplySettings:
Gui, Submit, NoHide
crosshairGUIClose()
Run *RunAs kombat.ahk
return

crosshairMover:
if (locked == 1)
{
  SetWinDelay, 1
  MouseGetPos, MouseX, MouseY
  tmp := CrosshairScale/2
  tmpx := Round(MouseX-tmp)
  tmpy := Round(MouseY-tmp)
  WinMove, crosshairGUI,, %tmpx%, %tmpy%
}
return

RubberMouse:
RubberMouseCoreProccess()
return

GuiClose:
ExitApp