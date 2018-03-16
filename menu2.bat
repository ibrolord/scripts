@ECHO OFF
REM - Batch file to present a menu of options
SETLOCAL

:Menu
cls
TYPE menu2.scr
ECHO.
SET /P KEY=Option [1,2,3,E]:
IF "%KEY%" == "1" GOTO Attrib
IF "%KEY%" == "2" GOTO Tree
IF "%KEY%" == "3" GOTO Vol
IF /i "%KEY%" == "E" GOTO End

ECHO.
ECHO ***Invalid option, enter 1, 2, 3, or E
pause
GOTO Menu

:Attrib
ECHO Inside Attrib
GOTO Menu

:Tree
ECHO Inside tree
GOTO Menu

:Vol
ECHO Inside Vol
GOTO Menu

:End
ENDLOCAL
