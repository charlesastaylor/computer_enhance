@echo off

where /q cl || (echo WARNING: cl not found -- MSVC executable will not be built)
REM @MODIFIED, I've not looked carefully, but clang buiilds are shitting out warnings, probably because its trying 
REM to use android clang or something?
where /q clang++MODIFIED || (echo WARNING: clang++ not found -- CLANG executables will not be built)

setlocal 

set buildpat=*%1*_main.cpp
if "%~1"=="" set buildpat=*_main.cpp
for %%g in (%buildpat%) DO (call build_single.bat %%g)

endlocal
