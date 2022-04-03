@ECHO OFF

ECHO Compile the EA.
ECHO Be sure to check the contents of the output log file to confirm that the compilation has completed successfully.
PAUSE

DEL /S "*.log"
DEL /S "*.ex4"
DEL /S "*.ex5"
RMDIR /s /q "MQL5\Experts\Advisors\"
RMDIR /s /q "MQL5_DEV\Experts\Advisors\"

SET MT4_PATH="C:\Program Files (x86)\MetaTrader 4\metaeditor.exe"
SET MT5_PATH="C:\Program Files\MetaTrader\metaeditor64.exe"

ECHO MT5 Folder Compiling ...
%MT5_PATH% /compile:"MQL5\Experts" /include:"MQL5" /log
%MT5_PATH% /compile:"MQL5\Scripts" /include:"MQL5" /log

ECHO MT5_DEV Folder Compiling ...
%MT5_PATH% /compile:"MQL5_DEV\Experts" /include:"MQL5_DEV" /log
%MT5_PATH% /compile:"MQL5_DEV\Scripts" /include:"MQL5_DEV" /log

ECHO MT4 Folder Compiling ...
%MT4_PATH% /compile:"MQL4\Experts" /include:"MQL4" /log
%MT4_PATH% /compile:"MQL4\Scripts" /include:"MQL4" /log

ECHO MT4_DEV Folder Compiling ...
%MT4_PATH% /compile:"MQL4_DEV\Experts" /include:"MQL4_DEV" /log
%MT4_PATH% /compile:"MQL4_DEV\Scripts" /include:"MQL4_DEV" /log

ECHO MT5\Experts MOVE TO MT5\Experts\Advisors Folder
XCOPY "MQL5\Experts\*.*" "MQL5\Experts\Advisors\"
XCOPY "MQL5_DEV\Experts\*.*" "MQL5_DEV\Experts\Advisors\"

ECHO Completed.
PAUSE
