This script reads a file and outputs a warning message when a hostname does not respond to a ping requests.

Synatx: powershell -ex bypass -file .\pingTest.ps1

note: in a test environment execute
set-executionpolicy remotesigned -force
