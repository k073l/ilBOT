#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%


Gui Add, Button, x8 y8 w101 h23 gadd, Dodaj do słownika
Gui Add, Button, x120 y8 w80 h23 gdecode, Odkoduj

Gui Show, w207 h39, Window
Return

GuiEscape:
GuiClose:
    ExitApp

encode:
{
InputBox
MsgBox % restpl
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
MsgBox % restpl
MsgBox % x
; FileAppend, %plrest% - %angielski%`n, %A_ScriptDir%\slownik.kitku
}

decode:
{
GuiControlGet, polskienc
}

