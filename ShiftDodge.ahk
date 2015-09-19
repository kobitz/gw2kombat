#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   ExitApp
}

Hotkey, ~Shift, SmartDodge

SmartDodge:
{
	if(GetKeyState("a", "P") or GetKeyState("d", "P") or GetKeyState("s", "P") or GetKeyState("w", "P"))
		Send, {v Down}
		KeyWait, Shift
		Send, {v Up}
}

F10::
Reload