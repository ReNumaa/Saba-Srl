@echo off
REM Script per backup incrementale da cartella di rete a disco locale
REM Modifica le variabili sottostanti secondo le tue esigenze

REM === CONFIGURAZIONE ===
set CARTELLA_ORIGINE=C:\Users\andrea\Desktop\Prova
set CARTELLA_DESTINAZIONE=C:\Users\andrea\Desktop\Prova copia

REM === INIZIO SCRIPT ===
echo ========================================
echo Script Backup Incrementale
echo Data/Ora: %date% %time%
echo ========================================

REM Verifica che la cartella di origine sia accessibile
if not exist "%CARTELLA_ORIGINE%" (
    echo ERRORE: La cartella di origine non è accessibile: %CARTELLA_ORIGINE%
    echo Verifica la connessione di rete e i permessi.
    pause
    exit /b 1
)

REM Crea la cartella di destinazione se non esiste
if not exist "%CARTELLA_DESTINAZIONE%" (
    echo Creazione cartella di destinazione: %CARTELLA_DESTINAZIONE%
    mkdir "%CARTELLA_DESTINAZIONE%" 2>nul
)



echo Inizio backup incrementale...
echo Origine: %CARTELLA_ORIGINE%
echo Destinazione: %CARTELLA_DESTINAZIONE%
echo.

REM Esegui il backup incrementale con ROBOCOPY
REM /MIR = Mirror (sincronizza le cartelle)
REM /XO = eXclude Older (non copia file più vecchi)
REM /R:3 = Retry 3 volte in caso di errore
REM /W:5 = Wait 5 secondi tra i tentativi
REM /NP = No Progress (non mostra percentuale)

robocopy "%CARTELLA_ORIGINE%" "%CARTELLA_DESTINAZIONE%" /MIR /XO /R:3 /W:5 /NP

REM Controlla il codice di uscita di ROBOCOPY
set EXITCODE=%ERRORLEVEL%

echo.
echo ========================================
if %EXITCODE% LEQ 1 (
    echo Backup completato con successo!
    echo Codice uscita: %EXITCODE%
) else if %EXITCODE% LEQ 7 (
    echo Backup completato con alcuni avvisi.
    echo Codice uscita: %EXITCODE%
) else (
    echo ERRORE durante il backup!
    echo Codice uscita: %EXITCODE%
)

echo Data/Ora fine: %date% %time%
echo ========================================

echo.
echo Backup terminato. Premere un tasto per chiudere...
pause >nul
