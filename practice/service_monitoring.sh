#!/bin/bash


service="apache2"

if  systemctl is-active --quiet "$service" ;

then
        echo "$service is  running . "
else
         echo "$service is not running . Attemting to start .... "
# Attempt to start service


        sudo systemctl start "$service"


        if systemctl is-active --quiet "$service" ; then
                echo "$service has been started successfully"
        else
                echo "failed to start $service "

        fi



fi
