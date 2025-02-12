#!/bin/bash

<<disclaimer

iss kahani ke sabhi patr aur ghatnae kalpanik h

disclaimer


read -p "enter gabbar dialouge: " gb

read -p "enter thakur dialouge: " th

read -p "kitne aadmi the : " admi


echo "$gb"
echo "$th"
echo "$admi"


if [[ $th == "nahi" ]];
then

        echo "jai veeru ki entry aur bhasad"
elif [[ $admi -ge 3 ]];
then
        echo "Gabbat let's go "

else
        echo "chop chop"

fi



echo "sholay khaatam"
