#Requires AutoHotkey v2.0

; Initialize audio
DllCall("winmm\mciSendString", "Str", "open new Type waveaudio Alias MySound", "Ptr", 0, "Int", 0, "Ptr", 0)
DllCall("winmm\mciSendString", "Str", "set MySound time format milliseconds", "Ptr", 0, "Int", 0, "Ptr", 0)

PlayInaudibleSound() {
    ; Generate 1ms of silence
    DllCall("winmm\mciSendString", "Str", "record MySound", "Ptr", 0, "Int", 0, "Ptr", 0)
    Sleep(1)
    DllCall("winmm\mciSendString", "Str", "stop MySound", "Ptr", 0, "Int", 0, "Ptr", 0)
    
    ; Play the "silent" sound
    DllCall("winmm\mciSendString", "Str", "play MySound", "Ptr", 0, "Int", 0, "Ptr", 0)
}

; Play the inaudible sound every 14 minutes
SetTimer(PlayInaudibleSound, 14 * 60 * 1000)

; Hotkey to exit the script (Ctrl+Q)
^q::ExitApp()

; Clean up on exit
OnExit((*) => DllCall("winmm\mciSendString", "Str", "close MySound", "Ptr", 0, "Int", 0, "Ptr", 0))