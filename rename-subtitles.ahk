#Requires AutoHotkey v2.0

MyGui := Gui(, "Rename subtitles")

MyGui.Add("Text", , "Suffix:")
suffix := MyGui.Add("Edit", "x+5 w100", ".Chinese")

MyGui.Add("Text", "xm", "Subtitle file is")
locaiton := MyGui.Add("DropDownList", "Choose1 x+5 w50", ["after", "before"])
MyGui.Add("Text", "x+5", "the media file")

MyGui.OnEvent("Close", ExitAppOnClose)
MyGui.Show()

#HotIf WinActive("ahk_exe explorer.exe")
F1:: {
    Send "{F2}^c"
    if (locaiton.value = 1) {
        Send "{Tab}"
    } else {
        Send "+{Tab}"
    }
    Send "^v"
    if (suffix != "") {
        SendText(suffix.value)
    }
    Send "{Tab}"
    if (locaiton.value = 2) {
        Send "{Tab}{Tab}"
    }
}

ExitAppOnClose(thisGui) {
    ExitApp 0
}
