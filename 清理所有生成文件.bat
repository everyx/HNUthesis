@echo off

@rem Public domain.

set COMPILER=xelatex
set TEMPFILE=*.aux *.log *.out *.thm *.tmp *.toc *.synctex
set TARGETFILE=*.gz *.pdf

goto cleanall

:compile
%COMPILER% *.tex
goto end

:cleanall
@del /A /F /Q /S %TARGETFILE% >nul 2>nul
goto clean

:clean
@del /A /F /Q /S %TEMPFILE% >nul 2>nul
goto end

:usage
echo %0 [compile] [clean] [cleanall]

:end
