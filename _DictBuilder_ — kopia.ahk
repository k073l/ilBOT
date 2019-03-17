#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

Gui Add, Edit, vrestpl

Gui Show, w434 h228, anything
Return

GuiEscape:
GuiClose:
    ExitApp
	
Enter::
Gui, Submit, NoHide
encode()

encode()
{
Gui, Submit, NoHide
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

