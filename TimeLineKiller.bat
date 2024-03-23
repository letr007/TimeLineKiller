@echo off
setlocal

title 时间线操作 by:letr

:menu
cls
echo.
echo                 ==================================
echo                         请选择要进行的操作
echo                 Select the action you want to take
echo                 ==================================
echo.
echo                         1.干掉时间线
echo                         1.Kill the timeline
echo.
echo                       2.把时间线救回来
echo                       2.Restore the timeline
echo.
echo                            Q.退出
echo                            Q.quit
echo.

:cho
set choice=
set /p choice=      请选择/Select:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%" == "1" goto kill
if /i "%choice%" == "2" goto recover
if /i "%choice%" == "Q" goto endd
echo.
echo 选择无效，请重新输入
echo The selection is invalid, please re-enter
echo.
goto cho

:kill
rem 导入注册表项
reg import kill.reg
set choice_2=
echo Does it take effect after the restart?
set /p choice_2= 重启后生效，是否重启？(y/N)
IF NOT "%choice_2%"=="" SET choice_2=%choice_2:~0,1%
if /i "%choice_2%" == "Y" goto rebot
if /i "%choice_2%" == "y" goto rebot
goto cancel

:recover
rem 导入注册表项
reg import recovery.reg
set choice_3=
echo Does it take effect after the restart?
set /p choice_3= 重启后生效，是否重启？(y/N)
IF NOT "%choice_3%"=="" SET choice_3=%choice_3:~0,1%
if /i "%choice_3%" == "Y" goto rebot
if /i "%choice_3%" == "y" goto rebot
goto cancel

:rebot
shutdown -r -t 0
exit

:cancel
echo.
echo 已取消。
echo Canceled.
pause
exit

:endd
exit