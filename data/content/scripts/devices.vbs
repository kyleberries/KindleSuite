Function test()
Dim oShell
Set oShell = WScript.CreateObject ("WScript.Shell")
oShell.run "cmd /K Dir"
Set oShell = Nothing
End function