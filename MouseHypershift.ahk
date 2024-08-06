#Requires AutoHotkey v2.0

; Use Numpad / as the modifier key
NumpadDiv:: {
    KeyWait "NumpadDiv"
}

; Define actions when NumpadDiv is held down
#HotIf GetKeyState("NumpadDiv", "P")

; Left click: Ctrl+C (Copy)
LButton:: Send "^v"

; Right click: Win+V (Clipboard history)
RButton:: Send "#v"

; Middle click: Win+Tab (Task view)
MButton:: Send "#{Tab}"

; Scroll up: Backspace
WheelUp:: Send "{Backspace}"

; Scroll down: Delete
WheelDown:: Send "{Delete}"

#HotIf

; Tray menu to exit the script
A_TrayMenu.Add("Exit", (*) => ExitApp())

; Notification that the script is running
MsgBox "Custom Mouse Button script is running. Use the tray icon to exit."