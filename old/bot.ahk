﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

FormatTime, OutputVar , dd/M/yyyy-HH:mm
czas := OutputVar

konto=0
numer = 1

;ZANIM COŚ ZMIENISZ
;SPRAWDŹ CZY NIE PISZESZ W .EXE
;I ZRÓB BACKUP
SplashTextOn , , , %numer%
Sleep, 100
WinMove, %numer%, , 0, 0  ; Move the splash window to the top left corner.


Menu, Tray, Icon, %A_ScriptDir%\content\icon.ico ;ikonka w tray'u

;gui
; Generated by AutoGUI 1.4.9a
#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

Gui Add, Picture, x96 y0 w149 h65, %A_ScriptDir%\content\thumbnail.png
Gui Add, Text, x169 y96 w5 h298 0x10
Gui Add, Text, x136 y72 w62 h17, kitku napisał
Gui Add, Text, x32 y104 w120 h23 +0x200, Jedyna w sumie ważna
Gui Add, Text, x32 y128 w120 h23 +0x200, rzecz, to pilnowanie
Gui Add, Text, x32 y152 w120 h23 +0x200, czy bot nie wpisuje
Gui Add, Text, x32 y176 w120 h23 +0x200, głupot, albo czy się
Gui Add, Text, x32 y200 w120 h23 +0x200, nie wywalił
Gui Add, Button, x184 y104 w120 h23 gsimple, Odpal bez k. rodzica
Gui Add, Button, x184 y128 w120 h23 grodzic, Odpal z k. rodzica
Gui Add, Text, x184 y152 w120 h23 +0x200, Kiedy już odpalisz,
Gui Add, Text, x184 y176 w120 h23 +0x200, zaloguj się i kieruj
Gui Add, Text, x184 y200 w120 h23 +0x200, się do tej strony:
Gui Add, Picture, x184 y224 w119 h78, %A_ScriptDir%\content\maiin.png
Gui Add, Text, x184 y304 w120 h23 +0x200, A następnie kliknij
Gui Add, Text, x184 y328 w120 h23 +0x200, CTRL+O, a
Gui Add, Text, x184 y352 w120 h23 +0x200, ESC lub CTRL+SHIFT+O
Gui Add, Text, x184 y376 w120 h23 +0x200, zatrzymuje bota.
Gui Add, Text, x32 y248 w120 h23 +0x200, Gdy zamkniecie to okno,
Gui Add, Text, x32 y272 w120 h23 +0x200, bot przestanie działać.

Gui Show, w337 h408, ilBOT
Return

GuiEscape:
GuiClose:
    ExitApp

; koniec gui

simple:
{
Gui, Submit, NoHide ;this command submits the guis' datas' state
Run, %A_ScriptDir%\firefox\firefox.exe -new-window https://instaling.pl/teacher.php?page=login
Sleep 500
MsgBox Protip: CTRL+M wycisza kartę. Zamknij to okienko, zmaksymalizuj firefoxa i polecam użyć CTRL+M.
}

rodzic:
{
konto=1
Gui, Submit, NoHide ;this command submits the guis' datas' state
Run, %A_ScriptDir%\firefox\firefox.exe -new-window https://instaling.pl/teacher.php?page=login
Sleep 500
MsgBox Protip: CTRL+M wycisza kartę. Zamknij to okienko, zmaksymalizuj firefoxa i polecam użyć CTRL+M.
}

^o::
go()

^i::
konto=1
go()

Esc::
{
ExitApp
SplashTextOff
}
^+o::
{
ExitApp
SplashTextOff
}

go() {
Loop {
Sleep 500
SplashTextOn , , , %numer%
Sleep, 100
WinMove, %numer%, , 0, 0  ; Move the splash window to the top left corner.
Sleep, 700
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\blad.png
if ErrorLevel{
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\two_buttons.png
if ErrorLevel{
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\two.png
if ErrorLevel{
Sleep 500
Send ^+c
/* Sleep 1000
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\gray.png
if ErrorLevel{
	MsgBox Nie mogę przenieść focusa na debuger
	}
else {
	iX += 30   ; add half of the image width
	iY += 7   ; add half of the image height
	Click, %iX%, %iY%, 0
	}
Send ^f
Sleep 1000
Send src
Sleep 1000
Send {Enter}
Sleep 500
Send {Enter}
Sleep 500
Send {Enter} */
Sleep 1000
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\blue.png
if ErrorLevel{
    ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\kitku.png
	if ErrorLevel{
	MsgBox Nie mogę znaleźć linku z odpowiedzią.
	}
	else {
	iX += 4   ; add half of the image width
	iY += 4   ; add half of the image height
	Click, %iX%, %iY%, Right
	}
	}
else{
iX += 4   ; add half of the image width
iY += 4   ; add half of the image height
Click, %iX%, %iY%, Right
}
Sleep 500 ; kopiuje link
Send E
Sleep 1000
Send ^a
Sleep 200
Send ^c
Sleep 200
String := Clipboard

html := RegexReplace(String, "([\s\S]*)<div id=.*jquery_audioPlayer", "")
rest := RegexReplace(html, "<\/audio>([\s\S]*)", "")

src := RegexReplace(rest, ".*src=", "")
endin := RegexReplace(src, ">.*", "")

Output1 := RegexReplace(endin, "%20", " ") ;spacebar
Output2 := RegexReplace(Output1, ".*\/", "") ;link
Output3 := RegexReplace(Output2, "\..*", "") ;extension
Output4 := RegexReplace(Output3, "%27", "'") ;' to '
Output5 := RegexReplace(Output4, "<body", "'")
Output6 := RegexReplace(Output5, "<div id.*", "'")


FoundPos := RegExMatch(Output6, ".*%.*")
FoundPoz := RegExMatch(FoundPos, ".*_.*")
FoundPox := RegExMatch(FoundPos, ".*\/.*")
FoundPoc := RegExMatch(FoundPos, ".*\..*")


ans := Output6
if (ans==proof) {
Output6 = stomachache
MsgBox Może być dobrze, ale sprawdź dla pewności. Ustawiłem odpowiedź na stomachache/koniec sesji.
}
if (ans==_empty){
Output6 = stomachache
MsgBox Może być dobrze, ale sprawdź dla pewności. Ustawiłem odpowiedź na stomachache.
}
proof := ans

FileAppend, Raw: %String%`n, %A_ScriptDir%\logi\%czas%log.txt
FileAppend, Ready: %Output6%`n, %A_ScriptDir%\logi\%czas%log.txt


if FoundPos {
MsgBox Exit: %Output6% contains percent sign.
ExitApp
}
if FoundPoz {
MsgBox Exit: %Output6% contains _ sign.
ExitApp
}
if FoundPox {
MsgBox Exit: %Output6% contains / sign.
ExitApp
}
if FoundPoc {
MsgBox Exit: %Output6% contains . sign.
ExitApp
}
Sleep 200
Send {F12} ;close inspector
Sleep 500
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\square.png
if ErrorLevel{
    ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\sqquare.png
	if ErrorLevel{
		ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\answer.png
		if ErrorLevel{
			ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\altans.png
			if ErrorLevel {
		MsgBox Nie mogę znaleźć pola do wpisania odpowiedzi lub koniec sesji.
}
		else {
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
		}
		else {
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
		}
		else {
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
		}
		else{
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
Sleep 700
Send %Output6%
Sleep 3000
Send {Enter}
Sleep 3000
/* ImageSearch, FoundXyyy, FoundYyyy, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\error.png
if ErrorLevel{
}
else {
MsgBox BŁĄD! %Output6%
ExitApp
} */
Send {Enter}
Sleep 3000
numer += 1
}
else{  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ELSE OD TWO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	if (konto==1) {
	Sleep 1000
	Send {Enter}
	Sleep 500
	Send ^+c
	Sleep 1000
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\gray.png
	if ErrorLevel{
	MsgBox Nie mogę przenieść focusa na debuger
	}
	else {
	iX += 30   ; add half of the image width
	iY += 7   ; add half of the image height
	Click, %iX%, %iY%, 0
	}
	Send ^f
	Sleep 1000
	Send src
	Sleep 1000
	Send {Enter}
	Sleep 500
	Send {Enter}
	Sleep 500
	Send {Enter}
	Sleep 1000
	ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\blue.png
	if ErrorLevel{
    ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\kitku.png
	if ErrorLevel{
	MsgBox Nie mogę znaleźć linku z odpowiedzią.
	}
	else {
	iX += 4   ; add half of the image width
	iY += 4   ; add half of the image height
	Click, %iX%, %iY%, Right
	}
	}
	else{
	iX += 4   ; add half of the image width
	iY += 4   ; add half of the image height
	Click, %iX%, %iY%, Right
	}
	Sleep 500 ; kopiuje link
	Send E
	Sleep 1000
	Send ^a
	Sleep 200
	Send ^c
	Sleep 200
	String := Clipboard

	html := RegexReplace(String, "([\s\S]*)<div id=.*jquery_audioPlayer", "")
	rest := RegexReplace(html, "<\/audio>([\s\S]*)", "")

	src := RegexReplace(rest, ".*src=", "")
	endin := RegexReplace(src, ">.*", "")
	

	Output1 := RegexReplace(endin, "%20", " ") 
	Output2 := RegexReplace(Output1, ".*\/", "") 
	Output3 := RegexReplace(Output2, "\..*", "") 
	Output4 := RegexReplace(Output3, "%27", "'") 
	Output5 := RegexReplace(Output4, "<body", "'")
	Output6 := RegexReplace(Output5, "<div id.*", "'")


	FoundPos := RegExMatch(Output6, ".*%.*")
	FoundPoz := RegExMatch(FoundPos, ".*_.*")
	FoundPox := RegExMatch(FoundPos, ".*\/.*")
	FoundPoc := RegExMatch(FoundPos, ".*\..*")


	ans := Output6
	if (ans==proof) {
	Output6 = stomachache
	}
	if (ans==_empty){
	Output6 = stomachache
	MsgBox Może być dobrze, ale sprawdź dla pewności. Ustawiłem odpowiedź na stomachache.
	}
	proof := ans

	FileAppend, Raw: %String%`n, %A_ScriptDir%\logi\%czas%log.txt
	FileAppend, Ready: %Output6%`n, %A_ScriptDir%\logi\%czas%log.txt


	if FoundPos {
	MsgBox Exit: %Output6% contains percent sign.
	ExitApp
	}
	if FoundPoz {
	MsgBox Exit: %Output6% contains _ sign.
	ExitApp
	}
	if FoundPox {
	MsgBox Exit: %Output6% contains / sign.
	ExitApp
	}
	if FoundPoc {
	MsgBox Exit: %Output6% contains . sign.
	ExitApp
	}
	Sleep 200
	Send {F12} ;close inspector
	Sleep 500
	ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\square.png
	if ErrorLevel{
	ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\sqquare.png
	if ErrorLevel{
		ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\answer.png
		if ErrorLevel{
			ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\altans.png
			if ErrorLevel {
		MsgBox Nie mogę znaleźć pola do wpisania odpowiedzi lub koniec sesji.
	}
		else {
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
		}
		else {
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
		}
		else {
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
		}
		else{
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
	Sleep 700
	Send %Output6%
	Sleep 3000
	Send {Enter}
	Sleep 3000
	ImageSearch, FoundXyyy, FoundYyyy, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\error.png
	if ErrorLevel{
	}
	else {
	MsgBox BŁĄD! %Output6%
	ExitApp
	}
	Send {Enter}
	Sleep 3000
	numer += 1
	}
	else {
    Sleep 1000
	Send {Enter}
	Sleep 300
	Send {Enter}
	Sleep 3000
	numer += 1
	}
}
}

else{
	if (konto==1) {
	Sleep 1000
	Send {Enter}
	Sleep 500
	Send ^+c
	Sleep 1000
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\gray.png
	if ErrorLevel{
	MsgBox Nie mogę przenieść focusa na debuger
	}
	else {
	iX += 30   ; add half of the image width
	iY += 7   ; add half of the image height
	Click, %iX%, %iY%, 0
	}
	Send ^f
	Sleep 1000
	Send src
	Sleep 1000
	Send {Enter}
	Sleep 500
	Send {Enter}
	Sleep 500
	Send {Enter}
	Sleep 1000
	ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\blue.png
	if ErrorLevel{
    ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\kitku.png
	if ErrorLevel{
	MsgBox Nie mogę znaleźć linku z odpowiedzią.
	}
	else {
	iX += 4   ; add half of the image width
	iY += 4   ; add half of the image height
	Click, %iX%, %iY%, Right
	}
	}
	else{
	iX += 4   ; add half of the image width
	iY += 4   ; add half of the image height
	Click, %iX%, %iY%, Right
	}
	Sleep 500 ; kopiuje link
	Send E
	Sleep 1000
	Send ^a
	Sleep 200
	Send ^c
	Sleep 200
	String := Clipboard

	html := RegexReplace(String, "([\s\S]*)<div id=.*jquery_audioPlayer", "")
	rest := RegexReplace(html, "<\/audio>([\s\S]*)", "")

	src := RegexReplace(rest, ".*src=", "")
	endin := RegexReplace(src, ">.*", "")

	Output1 := RegexReplace(endin, "%20", " ") ;spacebar
	Output2 := RegexReplace(Output1, ".*\/", "") ;link
	Output3 := RegexReplace(Output2, "\..*", "") ;extension
	Output4 := RegexReplace(Output3, "%27", "'") ;' to '
	Output5 := RegexReplace(Output4, "<body", "'")
	Output6 := RegexReplace(Output5, "<div id.*", "'")


	FoundPos := RegExMatch(Output6, ".*%.*")
	FoundPoz := RegExMatch(FoundPos, ".*_.*")


	ans := Output6
	if (ans==proof) {
	Output6 = stomachache
	}
	if (ans==_empty){
	Output6 = stomachache
	MsgBox Może być dobrze, ale sprawdź dla pewności. Ustawiłem odpowiedź na stomachache.
	}
	proof := ans

	FileAppend, Raw_twobuttons: %String%`n, %A_ScriptDir%\logi\%czas%log.txt
	FileAppend, Ready_twobuttons: %Output6%`n, %A_ScriptDir%\logi\%czas%log.txt


	if FoundPos {
	MsgBox Exit: %Output6% contains percent sign.
	ExitApp
	}
	if FoundPoz {
	MsgBox Exit: %Output6% contains _ sign.
	ExitApp
	}
	Sleep 200
	Send {F12} ;close inspector
	Sleep 500
	ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\square.png
	if ErrorLevel{
    ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\sqquare.png
	if ErrorLevel{
		ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\answer.png
		if ErrorLevel{
			ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\altans.png
			if ErrorLevel {
		MsgBox Nie mogę znaleźć pola do wpisania odpowiedzi lub koniec sesji.
}
		else {
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
		}
		else {
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
		}
		else {
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
		}
		else{
		iX += 15   ; add half of the image width
		iY += 15   ; add half of the image height
		Click, %iX%, %iY%
		}
	Sleep 700
	Send %Output6%
	Sleep 3000
	Send {Enter}
	Sleep 3000
	ImageSearch, FoundXyyy, FoundYyyy, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\error.png
	if ErrorLevel{
	}
	else {
	MsgBox BŁĄD! %Output6%
	ExitApp
	}
	Send {Enter}
	Sleep 3000
	numer += 1
	}
	else {
    Sleep 1000
	Send {Enter}
	Sleep 300
	Send {Enter}
	Sleep 3000
	numer += 1
	}
}
}
Else{
MsgBox Jakiś błąd. Zatrzymuję, a ty odśwież stronę.
ExitApp
SplashTextOff
}

}
}