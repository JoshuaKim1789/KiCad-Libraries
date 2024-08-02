@echo off
setlocal enabledelayedexpansion

rem Set the string to find and replace
set "search=KICAD7"
set "replace=KICAD8"

rem Loop through all text files in the folder
for %%f in (*_mod) do (
    rem Create a temporary file
    set "tempfile=%%~nf_tmp.txt"
    rem Read each line of the file and replace the string
    (
        for /f "delims=" %%a in (%%f) do (
            set "line=%%a"
            set "modified_line=!line:%search%=%replace%!"
            echo !modified_line!>> !tempfile!
        )
    )
    rem Replace the original file with the temporary file
    move /y "!tempfile!" "%%f" > nul
)

echo Done.

