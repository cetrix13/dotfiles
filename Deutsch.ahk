; Script for https://www.autohotkey.com/download/
SetCapsLockState, AlwaysOff

#If, GetKeyState("CapsLock", "P")
a::Send, ä
o::Send, ö
u::Send, ü
s::Send, ß      ;CapsLock+s = CapsLock+s, Eszett
+a::Send, Ä
+o::Send, Ö
+u::Send, Ü
#If

