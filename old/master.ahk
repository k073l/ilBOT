#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
^o::
Send ^m ;wycisza
Loop {
Sleep 500
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, two_buttons.png
if ErrorLevel{
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, two.png
if ErrorLevel{
Sleep 500
Send ^+c
Sleep 1000
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
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, blue.png
if ErrorLevel{
    ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, kitku.png
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

src := RegexReplace(String, ".*src=", "")
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
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, square.png
if ErrorLevel{
    ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, sqquare.png
	if ErrorLevel{
		ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, answer.png
		if ErrorLevel{
			ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, altans.png
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
ImageSearch, FoundXyyy, FoundYyyy, 0, 0, A_ScreenWidth, A_ScreenHeight, error.png
if ErrorLevel{
}
else {
MsgBox BŁĄD! %Output6%
ExitApp
}
Send {Enter}
Sleep 3000
}
else{
    Sleep 1000
	Send {Enter}
	Sleep 300
	Send {Enter}
	Sleep 3000
}
}

else{
    Sleep 1000
	Send {Enter}
	Sleep 300
	Send {Enter}
	Sleep 3000
}


}
Esc::
Send ^m ;wylacza wyciszenie
ExitApp

