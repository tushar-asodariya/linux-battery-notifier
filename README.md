# linux-battery-notifier

Sends notification when battery is above 95 to unplug the AC adapter and when battery is at 30, 40 and below 20 to plug-in AC adapter again.
With this branch I also play notification sounds, because it doesn't show notifications.
If we are in fullscreen mode let's say you are wathing a youtube video, 
you won't get any notifications earlier but now I sorted it.

## Steps to run this

- Install acpi
``` 
    sudo apt install acpi 
```
- Make file executable
- If any of your folder/directory name contains space like 'My Things' while writing file path write folder name as
- My\ Things
- Else You might get an error of no such file or directory
```
  chmod +x <file-path>
```
- Add file to [startup application](https://www.simplified.guide/gnome/automatically-run-program-on-startup)
- Reboot your linux
- Done!!!
