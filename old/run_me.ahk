#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Sleep 100
IfWinExist, Insta.Ling - skuteczna nauka słówek
    WinClose ; use the window found above


Run, %A_ScriptDir%\firefox\firefox.exe -new-window https://instaling.pl/teacher.php?page=login
Sleep 8000

   WinMove, Insta.Ling - skuteczna nauka słówek,,0,0, A_ScreenWidth, A_ScreenHeight

Sleep 100
MsgBox "Zaloguj się, odpal sesję, jak będziesz miał stronę, gdzie już się wpisuje to odpal master.exe i CTRL+O"

ExitApp
