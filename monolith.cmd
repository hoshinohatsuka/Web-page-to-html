@echo off 
set input=
set /p input=ÇëÊäÈëÍøÖ·:
for /f "tokens=2 delims=/" %%a in ("%input%") do set output=%%a
chcp 65001
monolith.exe "%input%" > %output%.html
@pause