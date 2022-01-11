@echo off
FOR /F "skip=1 tokens=1-6" %%A IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
	SET /A TODAY=%%F*10000+%%D*100+%%A
)
cd "curl"
set GIT_PATH="C:\Program Files\Git\bin\git.exe"
set BRANCH = "origin"
%GIT_PATH% add -A
%GIT_PATH% commit -am "Auto-committed on %TODAY%"
%GIT_PATH% push %BRANCH%
pause