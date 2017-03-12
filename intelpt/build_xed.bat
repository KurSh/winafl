@echo off
echo Building XED Disassembler

echo Activating VC++ 14 x64 compiler
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

pushd .
mkdir xed && cd xed && ^
git clone https://github.com/intelxed/xed.git xed && ^
git clone https://github.com/intelxed/mbuild.git mbuild && ^
cd xed && python mfile.py --no-encoder install
FOR /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set tdate=%%c-%%a-%%b)
xcopy /s kits\xed-install-base-%tdate%-win-x86-64\lib ..\lib\
xcopy /s kits\xed-install-base-%tdate%-win-x86-64\include\xed ..\include\
popd

