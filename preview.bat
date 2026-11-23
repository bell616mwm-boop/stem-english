@echo off
cd /d %~dp0
echo Starting the STEM English preview server...
echo A browser will open at http://localhost:8000 in a couple of seconds.
echo Keep this window open while previewing. Close it to stop the server.
start "" /min powershell -NoProfile -Command "Start-Sleep -Seconds 2; Start-Process 'http://localhost:8000'"
node preview-server.mjs
pause
