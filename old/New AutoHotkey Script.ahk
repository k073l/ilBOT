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
Sleep 1000
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\blue.png
if ErrorLevel{
    ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\kitku.png
	if ErrorLevel {
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

;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready: %Output6%`n, %A_ScriptDir%\logi\log.txt
;błędy
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
Sleep 1
}
else {
MsgBox BŁĄD! %Output6%
ExitApp
}
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
	Sleep 1000
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\blue.png
if ErrorLevel{
    ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\kitku.png
	if ErrorLevel {
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

;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready: %Output6%`n, %A_ScriptDir%\logi\log.txt
;błędy
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
Sleep 1
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
else{  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ELSE OD TWO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	if (konto==1) {
	Sleep 1000
	Send {Enter}
	Sleep 500
	Send ^+c
	Sleep 1000
	Sleep 1000
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\blue.png
if ErrorLevel{
    ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\kitku.png
	if ErrorLevel {
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

;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready: %Output6%`n, %A_ScriptDir%\logi\log.txt
;błędy
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
Sleep 1
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