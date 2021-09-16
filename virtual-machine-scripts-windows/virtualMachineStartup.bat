wmic process where "name='VBoxHeadless.exe'" delete

vboxmanage startvm Ubuntu --type headless