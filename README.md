# linux-battery-notifier
Sends notification when battery is above 95 to unplug the AC adapter and when battery is at 40, 30 and below 20 to plug-in AC adapter again.

## Steps to run this

- Install acpi
``` 
    sudo apt install acpi 
```
- Make file executable
- If any of your folder/directory name contains space like 'My Things' while writing file path write fodler name as
- My\ Things
- Else You might get an error of no such file or directory
```
  chmod +x <file-path>
```
- Add file to [startup application](https://www.simplified.guide/gnome/automatically-run-program-on-startup)
- Reboot your linux
- Done!!!
