@echo off
cls
if exist C:\Coding\melange\melange_kkm\Win32\Debug\kkm_base.fdb del C:\Coding\melange\melange_kkm\Win32\Debug\kkm_base.fdb
"C:\Program Files\Firebird\Firebird_2_5\bin\isql.exe" -i C:\Coding\melange\melange_kkm\db_script\kkm_base.sql
pause
@echo on
