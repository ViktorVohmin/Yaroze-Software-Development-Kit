@echo off
IF EXIST C:\PSX\BIN\SEQ_PLAY.X GOTO SEQCHECK
ECHO C:\PSX\BIN\SEQ_PLAY.X NOT INSTALLED
GOTO END
:SEQCHECK
IF EXIST %1 GOTO SEQOK
ECHO FILE NOT FOUND : %1
ECHO usage : seqplay seqfile
goto END
:SEQOK
ECHO loading : SEQ (%1) ...
dload -n%1 -a80100000 > nul
echo loading : player (c:\psx\bin\seq_play.x)...
load -nc:\psx\bin\seq_play.x > nul
go > nul
echo Press [SELECT]+[START] to quit player.
siocons c:\psx\bin\quit.aut > nul
:END
