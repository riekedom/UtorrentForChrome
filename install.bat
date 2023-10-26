@echo off



SET PATH=C:\Windows\System32;%PATH%

pushd "%~dp0"
CD app

IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
  ..\node\x64\node.exe install.js "%LocalAPPData%"
) ELSE (
  ..\node\x86\node.exe install.js "%LocalAPPData%"
)
echo "run as administrator"

reg add HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist /v 1 /t REG_SZ /d poechimcablfflpdhiamobbkgjpbgmnp /f
start "DM" "..\prg\utorrent_installer.exe" /w /s


PAUSE
