::set progNameToCompile=%2
::echo progNameToCompile
tasm /zi %1
pause
::set /p DUMMY=Hit ENTER to continue...
tlink /v %1
pause
td %1
