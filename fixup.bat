@echo off
Echo First, we scan the backup system file storage and try to repair it. This takes a lot of time.
pause
DISM /Online /Cleanup-Image /CheckHealth
echo Please note the outcome before we do the next step.
pause
echo Now, we scan the system files themselves and try to repair them. If this option fails,
echo you should consider doing a repair upgrade of Windows.
echo (Running an upgrade that doesn't upgrade to a higher edition so your system files are renewed from a fresh source)
pause
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow
echo Please note the outcome before we do the last step
pause
chkdsk /f /r C:\
Echo This scheduled a file system scan for the next system boot and will take a longer while.
echo Let it take its time and complete without interruption.
pause