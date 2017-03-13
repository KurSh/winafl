@echo off

echo "Installing intelpt service for WindowsPtDriver.sys"
sc stop intelpt
sc delete intelpt
copy /y WindowsIntelPT\x64\Release\WindowsPtDriver.sys .
copy /y WindowsIntelPT\x64\Release\PtControlApp.exe .
sc create intelpt binPath=%CD%\WindowsPtDriver.sys type=kernel
sc start intelpt