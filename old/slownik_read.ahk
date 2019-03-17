#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
restpl = ból brzucha
restpl := RegexReplace(restpl, "ę", "1")
restpl := RegexReplace(restpl, "ó", "2")
restpl := RegexReplace(restpl, "ą", "3")
restpl := RegexReplace(restpl, "ś", "4")
restpl := RegexReplace(restpl, "ł", "5")
restpl := RegexReplace(restpl, "ż", "6")
restpl := RegexReplace(restpl, "ź", "7")
restpl := RegexReplace(restpl, "ń", "8")
restpl := RegexReplace(restpl, " ", "9")
restpl := RegexReplace(restpl, "'", "0")

x := restpl

fileread, fCnt, %A_ScriptDir%\slownik.kitku  ;get the text from the file into a variable
;Now, loop through each line and see if it matches your results:

If RegExMatch(fCnt, "Om)^\Q" x "\E - (.+)$", m) {
y := m.1
MsgBox % y
}