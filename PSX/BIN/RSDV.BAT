@echo off

REM  RSDV version 1.0
REM  Preview RSD file (3D object data) on DTL-H3000
REM 

set PSXBIN=c:\psx\bin

set RSDLINK=%PSXBIN%\rsdlink
set PACKDATA=%PSXBIN%\packdata
set DLOAD=%PSXBIN%\dload
set LOAD=%PSXBIN%\load
set WAIT=%PSXBIN%\wait.bat
set GO=%PSXBIN%\go
set SIOCONS=%PSXBIN%\siocons
set RSDVIEW=%PSXBIN%\rsdview

if exist __tmp__.tmd  del __tmp__.tmd
if exist __tmp__.pck  del __tmp__.pck

if exist %1 goto RSDLINK
echo usage: rsdv rsd_file
goto END

:RSDLINK
echo Converting RSD into TMD ...
%RSDLINK% -o __tmp__.tmd %1 > out.txt
if not errorlevel 1 goto PACKDATA
echo RSDLINK failed; abort!
goto END

:PACKDATA
echo Packing TMD and TIM to create PCK ...
%PACKDATA% -o __tmp__.pck %1 __tmp__.tmd >> out.txt
if not errorlevel 1 goto DLOAD
echo PACDATA failed; abort!
goto END

:DLOAD
echo Loading PCK ...
%DLOAD% -n__tmp__.pck -a80100000 >> out.txt
if not errorlevel 1 goto LOAD
echo DLOAD failed; abort!
goto END

:LOAD
echo Loading program ...
%LOAD% -n%RSDVIEW% >> out.txt
if not errorlevel 1 goto GO
echo LOAD failed; abort!
goto END

:GO
echo Go ...

%GO% >> out.txt

REM waiting for H3000 termiation
%SIOCONS% %WAIT% >> out.txt
:END

