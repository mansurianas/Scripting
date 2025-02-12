
#!/bin/bash




THRESHOLD=80
EMAIL="wd894118@gmail.com"
# Get the current disk usage percentage for root filesystem
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')


#check if the USAGE variable is set and  is a number
if ! [[ "$USAGE" =~ ^[0-9]+$ ]] ;
        then
                echo "ERROR : unable to retrieve disk usage "
                exit 1
fi

# check if usage exceeds the threshold

if [ "$USAGE" -gt "$THRESHOLD" ];
then                                                                          echo " Disk usage is above ${THRESHOLD}% : Current usage is ${USAGE}%."


#send an email notification

echo "warning: Disk usage is at ${USAGE}%. WHICH exceeds the threshold ${THRESHOLD}%." | mail -s "Disk usage alert" "$EMAIL"
else

        echo " Disk usage within limit : Current usage is ${USAGE}%. "

fi
