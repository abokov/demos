@echo off
set LOG=%WEBJOBS_DATA_PATH%\%WEBJOBS_RUN_ID%\session2.log
 
echo Running script... >> %LOG%
date /T >> %LOG%
time /T >> %LOG%
REM we can run some EXE here and save status in RESULT
set RESULT=%ERRORLEVEL%
echo Result code is %RESULT%
 
rem Dumping session log to Azure log (standard output) when it exists
if exist %LOG% (
    echo Session log:
    type %LOG%
)
 
rem Propagating WinSCP exit code to Azure
exit %RESULT%
