@echo off
echo. | date | FIND "(mm" > NUL
If errorlevel 1,(call :Parsedate DD MM) Else,(call :Parsedate MM DD)
goto :EOF
:Parsedate ----------------------------------------------------------
For /F "tokens=1-4 delims=/.- " %%A in ('date /T') do if %%D!==! (
set %1=%%A&set %2=%%B&set YYYY=%%C
) else (
set DOW=%%A&set %1=%%B&set %2=%%C&set YYYY=%%D)

(Set date=%DD%-%MM%-%YYYY%)
set log=\\LOCATIE\%date%\
set flname=.txt

REM =====Create log folder =====
md \\LOCATIE\Data01$\Log\%date%\

REM =======TEST======
REM START Robocopy "\\Bronlocatie" "\\Destinationlocatie" /E /ZB /R:0 /W:0 /NFL /NDL /NP /LOG+:%log%ST-Datacopy_ADGebruikersBeheer\%flname%

REM =======Productie======
START Robocopy "\\Bronlocatie" "\\Destinationlocatie" /MIR /MT:32 /R:0 /W:0 /L /NFL /NDL /NP /LOG+:\\Destinationlocatie\logfile.txt

