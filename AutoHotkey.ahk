; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

;  Use # for Win
;  Use ^ for Ctrl
;  Use ! for Alt

; Look to http://www.autohotkey.com/docs/commands.htm for all the commands

; **************** Run Programs **************** ;

;Launch or bring to front emacs. 
^!e::
IfWinExist emacs
	WinActivate
else
	Run, C:\Program Files\emacs-24.3\bin\emacsclient.exe
return


; **************** Sound Settings **************** ;
^!#Left::SoundSet -2
^!#Right::SoundSet +2
^!#Down::SoundSet, +1,,mute

; **************** TEXT EXPANSIONS **************** ;
::teh::the

; **************** Spotify Contols **************** ;
^!#Ins:: 
DetectHiddenWindows, On 
ControlSend, ahk_parent, ^{Left}, ahk_class SpotifyMainWindow 
DetectHiddenWindows, Off 
return 

^!#Home:: 
DetectHiddenWindows, On 
ControlSend, ahk_parent, ^{Right}, ahk_class SpotifyMainWindow 
DetectHiddenWindows, Off 
return 

^!#PgUp::
{ 
DetectHiddenWindows, On 
ControlSend, ahk_parent, {space}, ahk_class SpotifyMainWindow 
DetectHiddenWindows, Off 
return 
} 