@echo off
setlocal

title ʱ���߲��� by:letr

:menu
cls
echo.
echo                 ==================================
echo                         ��ѡ��Ҫ���еĲ���
echo                 Select the action you want to take
echo                 ==================================
echo.
echo                         1.�ɵ�ʱ����
echo                         1.Kill the timeline
echo.
echo                       2.��ʱ���߾Ȼ���
echo                       2.Restore the timeline
echo.
echo                            Q.�˳�
echo                            Q.quit
echo.

:cho
set choice=
set /p choice=      ��ѡ��/Select:
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%" == "1" goto kill
if /i "%choice%" == "2" goto recover
if /i "%choice%" == "Q" goto endd
echo.
echo ѡ����Ч������������
echo The selection is invalid, please re-enter
echo.
goto cho

:kill
rem ����ע�����
reg import kill.reg
set choice_2=
echo Does it take effect after the restart?
set /p choice_2= ��������Ч���Ƿ�������(y/N)
IF NOT "%choice_2%"=="" SET choice_2=%choice_2:~0,1%
if /i "%choice_2%" == "Y" goto rebot
if /i "%choice_2%" == "y" goto rebot
goto cancel

:recover
rem ����ע�����
reg import recovery.reg
set choice_3=
echo Does it take effect after the restart?
set /p choice_3= ��������Ч���Ƿ�������(y/N)
IF NOT "%choice_3%"=="" SET choice_3=%choice_3:~0,1%
if /i "%choice_3%" == "Y" goto rebot
if /i "%choice_3%" == "y" goto rebot
goto cancel

:rebot
shutdown -r -t 0
exit

:cancel
echo.
echo ��ȡ����
echo Canceled.
pause
exit

:endd
exit