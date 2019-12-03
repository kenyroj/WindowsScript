@echo off
SET ADB=adb
:: SET ADB=adb -s WUJ01NND75

if '%1'=='' (
   color
   @ECHO  *** Need apk file name as params. ***
   GOTO :EOF
)

if EXIST %1 (
   Echo Install: "%~1"
   @COPY "%~1" __tmp__.apk > NUL
   %ADB% install -r __tmp__.apk
   @DEL __tmp__.apk > NUL
)

:EOF