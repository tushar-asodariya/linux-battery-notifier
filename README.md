# linux-battery-notifier
Sends notification when battery is above 95 to unplug the AC adapter and when battery is below 20 to plug-in AC adapter again.

#Steps to run this

- Install acpi
``` 
    sudo apt install acpi 
```
- Make file executable
```
  chmod +x <file-path>
```
- Add file to [startup application](https://www.simplified.guide/gnome/automatically-run-program-on-startup)
- Reboot your linux
- Done!!!
