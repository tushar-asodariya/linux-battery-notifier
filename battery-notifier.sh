#!/bin/bash
#please install acpi before using this ==> sudo apt install acpi
while true; do
    export DISPLAY=:0.0
    battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    ac_adapter=$(acpi -a | cut -d' ' -f3 | cut -d- -f1)

    if on_ac_power; then                   #check if AC is plugged in
        if [ $battery_level -ge 95 ]; then #check if the battery level is over 90%
            notify-send -u critical "Please, kindly unplug your AC adapter" "Battery level: ${battery_level}%" -i battery-full-charged
            # sleep 300
        elif [ $battery_level -le 20 ]; then
            notify-send -u critical "Thank you!!!" "You did an excellent job, Keep it up." -i battery-caution-charging
            sleep 300 #sleep as charging upto 20 take 15 min max
            # break
        fi
        #if [ $ac_adapter -eq "off" ]; then
        #    notify-send -u critical "AC Adapter" "The AC Adapter is off."
    #fi

    fi

    if [ "$ac_adapter" == "off" ]; then
        if [ $battery_level -le 20 ]; then #check if the battery level is over 90%
            notify-send -u critical "Please, kindly plug-in your AC adapter" "Battery level: ${battery_level}%" -i battery-caution
	        # To get the sound notification
	        aplay sounds/mixkit-wrong-answer-fail-notification-946.wav
            # break
            # sleep 180
        elif [ $battery_level -le 30 ]; then
            notify-send -u critical "Charge it man its ${battery_level}%" -i battery-caution

	        # To get the sound notification
	        aplay sounds/mixkit-bell-notification-933.wav
            # break
            sleep 200
        elif [ $battery_level == 40 ]; then
            notify-send -u critical "Its ${battery_level}%" -i face-angel
	        # To get the sound notification
            aplay sounds/mixkit-bell-notification-933.wav

            # break
            sleep 180
        elif [ $battery_level -ge 95 ]; then
            notify-send -u critical "Thank you!!!" "You did an excellent job,Now remove the charger." -i face-angel
	        # To get the sound notification
	        aplay sounds/mixkit-melodical-flute-music-notification-2310.wav
            sleep 90 # sleep as charging is above 95
        fi
    fi
    sleep 5 #wait for 300 seconds before checking again

done

#to add this to startup application ==> https://www.simplified.guide/gnome/automatically-run-program-on-startup
