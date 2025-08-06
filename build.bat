:: ！！请用管理员权限运行！！
@echo off
:: ============配置部分自行修改============
:: VsDevCmd.bat文件位置
set VSDEVC="C:\Program Files (x86)\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"
:: (Aseprite)[https://github.com/aseprite/aseprite/releases]
set ASEPRITE="D:\software\Aseprite"
:: (Skia)[https://github.com/aseprite/skia/releases]
set DSKIA_DIR="D:\DevlopPackages\skia"
:: (Ninja)[https://github.com/ninja-build/ninja/releases]
set NINJA="D:\DevlopApp\ninja"
:: ============分割线============


:: ============以下谨慎修改============
set PATH=%NINJA%;%PATH%
call %VSDEVC% -arch=x64
cd /d %ASEPRITE%
if exist build rd /s /q build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=%DSKIA_DIR% -DSKIA_LIBRARY_DIR=%DSKIA_DIR%\out\Release-x64 -DSKIA_LIBRARY=%DSKIA_DIR%\out\Release-x64\skia.lib -G Ninja ..
ninja aseprite
echo Finish
if exist bin explorer bin
pause