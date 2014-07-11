@echo off
if exist resources\scripts\restore\update.zip start resources\scripts\restore\restore.bat
if not exist resources\scripts\restore\update.zip start resources\scripts\restore\restoredl.bat
exit