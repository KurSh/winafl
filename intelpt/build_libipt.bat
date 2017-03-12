@echo off
echo Activating VC++ 14 x64 compiler
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

pushd .
mkdir libipt-build & cd libipt-build 
REM cmake ..\processor-trace -G"Visual Studio 14 2015 Win64" -DPTDUMP=ON -DPTXED=ON -DXED_INCLUDE=..\xed\include\xed -DXED_LIBDIR=..\xed\lib && 
cmake ..\processor-trace -G"Visual Studio 14 2015 Win64" -DPTDUMP=ON && ^
cmake --build . --config Release && ^
copy /y bin\Release\* .. && ^
copy /y lib\Release\* .. 
REM cd .. && rmdir /s /q libipt-build
popd 