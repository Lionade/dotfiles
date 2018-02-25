#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr" 
then	
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1)
	do		
		if [ "$m" == "DVI-D-0" ]
		then
			MONITOR1=$m polybar main &
			#MONITOR1=$m polybar powermenubar &
		else
			MONITOR2=$m polybar side &
		fi
	done
else
	polybar main &
fi

# Launch bar1 and bar2
#polybar example &


echo "Bars launched..."
