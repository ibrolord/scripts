@echo off
net use W: /d /y
NET USE W: \\JMR-TECH06\cygwin64 /Persistent:No
net use q: /d /y
NET USE q: \\JMR-TECH06\josh /Persistent:No
cd "C:\Users\jmr\Desktop\"
start "" "C:\Users\jmr\Desktop\Start - Shortcut.lnk"
exit
