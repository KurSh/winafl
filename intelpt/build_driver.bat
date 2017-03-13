@echo off 

echo Activating VC++ 14 x64 compiler
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

pushd .
cd WindowsIntelPT
msbuild WindowsIntelPt.sln /p:Configuration=Release /p:Platform=x64
popd

call install_driver.bat
