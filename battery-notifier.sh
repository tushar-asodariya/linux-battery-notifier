#!/bin/bash
#please install acpi before using this ==> sudo apt install acpi
while true; do
    export DISPLAY=:0.0
    battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    ac_adapter=$(acpi -a | cut -d' ' -f3 | cut -d- -f1)

    if on_ac_power; then                   #check if AC is plugged in
        if [ $battery_level -ge 95 ]; then #check if the battery level is over 90%
            notify-send -u critical "Please, kindly unplug your AC adapter" "Battery level: ${battery_level}%" -i battery-full-charged
        elif [ $battery_level -le 20 ]; then
            notify-send -u critical "Thank you!!!" "You did an excellent job, Keep it up." -i battery-caution-charging
            sleep 900 #sleep as charging upto 20 take 15 min max
        fi
        #if [ $ac_adapter -eq "off" ]; then
        #    notify-send -u critical "AC Adapter" "The AC Adapter is off."
    #fi

    fi

    if [ "$ac_adapter" == "off" ]; then
        if [ $battery_level -le 20 ]; then #check if the battery level is over 90%
            notify-send -u critical "Please, kindly plug-in your AC adapter" "Battery level: ${battery_level}%" -i battery-caution
        else
            notify-send -u critical "Thank you!!!" "You did an excellent job, Keep it up." -i face-angel
            sleep 7200 # sleep as charging is above 95
        fi
    fi
    sleep 5 #wait for 300 seconds before checking again

done

#to add this to startup application ==> https://www.simplified.guide/gnome/automatically-run-program-on-startup
