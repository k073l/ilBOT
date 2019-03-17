#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#SingleInstance Force

proof=_empty
konto=0
numer = 1

;BETA 1.1
;FULLAUTO WERSJA
;by kitku
SplashTextOn , , , %numer%
Sleep, 100
WinMove, %numer%, , 0, 0  ; Move the splash window to the top left corner.


Menu, Tray, Icon, %A_ScriptDir%\content\icon.ico ;ikonka w tray'u

Random, rand, 2037, 2038 ;dla 'naturalnosci' przyjmujemy ze wchodzimy na serwer zeby afczyc miedzy 5:20 a 5:30
SetTimer, TimerRestartu, 50
return

TimerRestartu:
FormatTime, TimeToMeet,,HHmm

;WŁAŚCIWA CZĘŚĆ SKRYPTU
If (TimeToMeet == rand){
	If (triggered == 0) {
triggered = 1
konto = 1
Run, %A_ScriptDir%\firefox\firefox.exe -new-window https://instaling.pl/teacher.php?page=login
Sleep 500
Send {Ctrl Down}m{Ctrl Up}
Sleep 4000
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\start_adult.png
if ErrorLevel{
;zakładamy, że użytkownik ma konto ucznia
;MsgBox DEBUG NO START ADULT
}
else{
;tu dać kilk
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\next_adult.png
if ErrorLevel{
;again, jak nie ma rodzica, to nie ma wyboru konta
;MsgBox DEBUG NO NEXT ADULT
}
else{
;tu dać kilk
;MsgBox DEBUG NEXT ADULT HERE
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\start_student.png
if ErrorLevel{
;tu dać 2. opcję start studenta

ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\start_student2.png
if ErrorLevel{
;kurwa już nie wiem
;MsgBox DEBUG NO START STUDENTS
}
else{
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
}
}
else{
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
	
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\start_student2.png
if ErrorLevel{
;tu dać 1. opcję start studenta
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\start_student1.png
if ErrorLevel{
;kurwa już nie wiem
;MsgBox DEBUG NO START STUDENTS
}
else{
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
}
}
else{
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
;start, i hope
Sleep 4000
Send ^o
}
}
}
}
}

simple:
{
konto = 0
Run, %A_ScriptDir%\firefox\firefox.exe -new-window https://instaling.pl/teacher.php?page=login
Sleep 500
Send {Ctrl Down}m{Ctrl Up}
Sleep 4000
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\start_adult.png
if ErrorLevel{
;zakładamy, że użytkownik ma konto ucznia
;MsgBox DEBUG NO START ADULT
}
else{
;tu dać kilk
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\next_adult.png
if ErrorLevel{
;again, jak nie ma rodzica, to nie ma wyboru konta
;MsgBox DEBUG NO NEXT ADULT
}
else{
;tu dać kilk
;MsgBox DEBUG NEXT ADULT HERE
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\start_student.png
if ErrorLevel{
;tu dać 2. opcję start studenta

ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\start_student2.png
if ErrorLevel{
;kurwa już nie wiem
;MsgBox DEBUG NO START STUDENTS
}
else{
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
}
}
else{
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
	
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\start_student2.png
if ErrorLevel{
;tu dać 1. opcję start studenta
ImageSearch, iX, iY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\start_student1.png
if ErrorLevel{
;kurwa już nie wiem
;MsgBox DEBUG NO START STUDENTS
}
else{
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
}
}
else{
	iX += 14
	iY += 14
	Click, %iX%, %iY%
	Sleep 4000
;start, i hope
Sleep 4000
Send ^o
}
}
}
}
}

;cz wlasciwa
^o::
Loop {
Sleep 500
SplashTextOn , , , %numer%
Sleep, 100
WinMove, %numer%, , 0, 0  ; Move the splash window to the top left corner.
Sleep, 500
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\blad.png
if ErrorLevel{
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\two_buttons.png
if ErrorLevel{
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\content\two.png
if ErrorLevel{
Sleep 500
Send ^+c
Sleep 1800
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

htmlpl := RegexReplace(String, "([\s\S]*)<div id=.answer_translations. class=.translations.>", "")
restpl := RegexReplace(htmlpl, "<\/div>([\s\S]*)", "")
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
fileread, fCnt, %A_ScriptDir%\slownik.kitku  ;get the text from the file into a variable
;Now, loop through each line and see if it matches your results:

If RegExMatch(fCnt, "Om)^\Q" x "\E - (.+)$", m) {
y := m.1
;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw_stom: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready_stom: %Output6%`n, %A_ScriptDir%\logi\log.txt
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
			
;koniec
Send !{F4}
Sleep 500
Send {Esc}
		
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
Send %y%
Sleep 3000
Send {Enter}
Sleep 3000
;do if stomachache
}
}
else{
if (ans==_empty){
fileread, fCnt, %A_ScriptDir%\slownik.kitku  ;get the text from the file into a variable
;Now, loop through each line and see if it matches your results:

If RegExMatch(fCnt, "Om)^\Q" x "\E - (.+)$", m) {
y := m.1
;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw_stom: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready_stom: %Output6%`n, %A_ScriptDir%\logi\log.txt
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
			
;koniec
Send !{F4}
Sleep 500
Send {Esc}
		
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
Send %y%
Sleep 3000
Send {Enter}
Sleep 3000
;do if stomachache
}
}
else{
proof := ans

;słownik
fileread, fCnt, %A_ScriptDir%\slownik.kitku
If RegExMatch(fCnt, "Om)^\Q" x "\E - (.+)$", m) {
}
else{
FileAppend, %restpl% - %Output6%`n, %A_ScriptDir%\slownik.kitku
}


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
			
;koniec
Send !{F4}
Sleep 500
Send {Esc}
		
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
}
}
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

htmlpl := RegexReplace(String, "([\s\S]*)<div id=.answer_translations. class=.translations.>", "")
restpl := RegexReplace(htmlpl, "<\/div>([\s\S]*)", "")
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
fileread, fCnt, %A_ScriptDir%\slownik.kitku  ;get the text from the file into a variable
;Now, loop through each line and see if it matches your results:

If RegExMatch(fCnt, "Om)^\Q" x "\E - (.+)$", m) {
y := m.1
;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw_stom: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready_stom: %Output6%`n, %A_ScriptDir%\logi\log.txt
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
			
;koniec
Send !{F4}
Sleep 500
Send {Esc}
		
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
Send %y%
Sleep 3000
Send {Enter}
Sleep 3000
;do if stomachache
}
}
else{
if (ans==_empty){
fileread, fCnt, %A_ScriptDir%\slownik.kitku  ;get the text from the file into a variable
;Now, loop through each line and see if it matches your results:

If RegExMatch(fCnt, "Om)^\Q" x "\E - (.+)$", m) {
y := m.1
;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw_stom: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready_stom: %Output6%`n, %A_ScriptDir%\logi\log.txt
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
			
;koniec
Send !{F4}
Sleep 500
Send {Esc}
		
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
Send %y%
Sleep 3000
Send {Enter}
Sleep 3000
;do if stomachache
}
}
else{
proof := ans

;słownik
fileread, fCnt, %A_ScriptDir%\slownik.kitku
If RegExMatch(fCnt, "Om)^\Q" x "\E - (.+)$", m) {
}
else{
FileAppend, %restpl% - %Output6%`n, %A_ScriptDir%\slownik.kitku
}



;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw_acc: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready_acc: %Output6%`n, %A_ScriptDir%\logi\log.txt
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
			
;koniec
Send !{F4}
Sleep 500
Send {Esc}
		
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
}
}
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

htmlpl := RegexReplace(String, "([\s\S]*)<div id=.answer_translations. class=.translations.>", "")
restpl := RegexReplace(htmlpl, "<\/div>([\s\S]*)", "")
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
fileread, fCnt, %A_ScriptDir%\slownik.kitku  ;get the text from the file into a variable
;Now, loop through each line and see if it matches your results:

If RegExMatch(fCnt, "Om)^\Q" x "\E - (.+)$", m) {
y := m.1
;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw_stom: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready_stom: %Output6%`n, %A_ScriptDir%\logi\log.txt
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
			
;koniec
Send !{F4}
Sleep 500
Send {Esc}
		
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
Send %y%
Sleep 3000
Send {Enter}
Sleep 3000
;do if stomachache
}
}
else{
if (ans==_empty){
fileread, fCnt, %A_ScriptDir%\slownik.kitku  ;get the text from the file into a variable
;Now, loop through each line and see if it matches your results:

If RegExMatch(fCnt, "Om)^\Q" x "\E - (.+)$", m) {
y := m.1
;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw_stom: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready_stom: %Output6%`n, %A_ScriptDir%\logi\log.txt
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
			
;koniec
Send !{F4}
Sleep 500
Send {Esc}
		
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
Send %y%
Sleep 3000
Send {Enter}
Sleep 3000
;do if stomachache
}
}
else{
proof := ans

;słownik
fileread, fCnt, %A_ScriptDir%\slownik.kitku
If RegExMatch(fCnt, "Om)^\Q" x "\E - (.+)$", m) {
}
else{
FileAppend, %restpl% - %Output6%`n, %A_ScriptDir%\slownik.kitku
}



;logi
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Raw_acc: %String%`n, %A_ScriptDir%\logi\log.txt
FileAppend, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec% Ready_acc: %Output6%`n, %A_ScriptDir%\logi\log.txt
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
			
;koniec
Send !{F4}
Sleep 500
Send {Esc}
		
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
}
}
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

triggered = 0
}
Esc::ExitApp
