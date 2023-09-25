@echo off
IF EXIST C:\PSX\BIN\SEQ_PLAY.X GOTO SEQCHECK
ECHO C:\PSX\BIN\SEQ_PLAY.X NOT INSTALLED
GOTO END
:SEQCHECK
IF EXIST %1 GOTO SEQOK
ECHO SEQ FILE NOT FOUND : %1
ECHO usage : vabplay seqfile vhfile vbfile
goto END
:SEQOK
IF EXIST %2 GOTO VHOK
ECHO VH FILE NOT FOUND : %2
ECHO usage : vabplay seqfile vhfile vbfile
GOTO END
:VHOK
IF EXIST %3 GOTO VBOK
ECHO VB FILE NOT FOUND : %3
ECHO usage : vabplay seqfile vhfile vbfile
GOTO END
:VBOK
echo loading : SEQ (%1)...
dload -n%1 -a80100000 > nul
echo loading : VH (%2)...
dload -n%2 -a80140000 > nul
echo loading : VB (%3)...
dload -n%3 -a80160000 > nul
echo loading : player (c:\psx\bin\vab_play.x)...
load -nc:\psx\bin\vab_play.x > nul
go > nul
echo Press [SELECT]+[START] to quit player.
siocons c:\psx\bin\quit.aut > nul
:END
