@echo off

REM  TIMV version 1.0
REM  Preview TIM file (image data) on DTL-H3000
REM 

set PSXBIN=c:\psx\bin

set DLOAD=%PSXBIN%\dload
set LOAD=%PSXBIN%\load
set WAIT=%PSXBIN%\wait.bat
set GO=%PSXBIN%\go
set SIOCONS=%PSXBIN%\siocons
set TIMVIEW=%PSXBIN%\timview

 
if exist %1 goto DLOAD
echo Usage: timv tim_file
goto END

:DLOAD
echo Loading TIM data ...
%DLOAD% -n%1 -a80120000 > out.txt
if not errorlevel 1 goto LOAD
echo DLOAD failed; abort!
goto END

:LOAD
echo Loading program ...
%LOAD% -n%TIMVIEW% >> out.txt
if not errorlevel 1 goto GO
echo LOAD failed; abort!
goto END

:GO
echo Go...
go >> out.txt
%SIOCONS% %WAIT% >> out.txt
:END


