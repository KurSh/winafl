@echo off
echo Activating VC++ 14 x64 compiler
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

echo Building winafl
pushd .
mkdir x64 & cd x64
cmake .. -G"Visual Studio 14 2015 Win64" -DDynamoRIO_DIR=dynamorio\exports\cmake
cmake --build . --config RelWithDebInfo
copy /y RelWithDebInfo\*.exe ..
copy /y RelWithDebInfo\*.dll ..
copy /y RelWithDebInfo\*.pdb ..
popd