cd CEF
@IF EXIST build GOTO JUMP1
mkdir build
:JUMP1
@cd build
where /q cmake
IF ERRORLEVEL 1 (
@    ECHO You need to install cmake
@    ECHO https://cmake.org/download/
@    PAUSE
@    EXIT /B
) ELSE (
@    ECHO cmake found
)
cmake -G "Visual Studio 14 Win64" ..
REM cd libcef_dll_wrapper
REM msbuild /p:Configuration=Debug   /m /clp:Summary /nologo
REM msbuild /p:Configuration=Release /m /clp:Summary /nologo
REM cd Debug
REM copy *.* ..\..\..\..\AntTweakBar\examples\debug64\
REM cd ..
REM cd Release
REM copy *.* ..\..\..\..\AntTweakBar\examples\release64\
REM cd ..
REM cd ..
msbuild /p:Configuration=Debug   /m /clp:Summary /nologo ALL_BUILD.vcxproj
msbuild /p:Configuration=Release /m /clp:Summary /nologo ALL_BUILD.vcxproj
xcopy /S /Y libcef_dll_wrapper\Debug\*.* ..\..\AntTweakBar\examples\debug64\
xcopy /S /Y libcef_dll_wrapper\Release\*.* ..\..\AntTweakBar\examples\bin64\
xcopy /S /Y cefclient\Debug\*.* ..\..\AntTweakBar\examples\debug64\
xcopy /S /Y cefclient\Release\*.* ..\..\AntTweakBar\examples\bin64\

