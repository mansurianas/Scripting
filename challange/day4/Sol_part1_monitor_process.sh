#!/bin/bash


# this function check if  specified process is running
is_process_running() {


        if pgrep -x "$1" >/dev/null;
        then
                return 0 #process is running
        else
                return 1 #process is not running
        fi


}

#function to restart the process using systemctl
restart_process() {




        local process_name="$1"
        echo "process "$process_name" is not running. Attempting to restart.."

        #attempt to restart the process
        if sudo systemctl restart;
        then
                echo " restarted successfully"

        else
                echo "failed to start . please check the process manually."


                notify_admin "process_name"
        fi





}

#function to notify the administrator
notify_admin() {


        local process_name="$1"

        echo "ALERT: process "$process_name" require manual intervention!"


}

#check if a process name is provided as an argument

if [ $# -eq 0 ];
then
        echo "Usage: $0 <process_name>"
        exit 1
fi


process_name="$1"
max_attempt=3
attempt=1


# loop to check and restart the process

while [ $attempt -le $max_attempt ];
do
        if is_process_running "$process_name";
        then
                echo "process "$process_name" is running."

                exit 0 #exit if process is running

        else
                restart_process "$process_name"

        fi


        attempt=$((attempt + 1)) # Increments the attempt counter by 1 after each check.


        sleep 5 #wait for 5 seconds before the next check to avoid overwhelming the system with requests


done
echo "Maximum restart attempts reached. please check the process manually"
