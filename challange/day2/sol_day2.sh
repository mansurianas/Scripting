
#!/bin/bash


echo "Welcome to file and Directory exploration"


while true ;
do

 echo "files and directories in current path"

 ls -lh

#prompt the user to conitnue or exit


 read -p "press enter to refresh the list or type 'exit' to quit : " user_input


#exit if user types 'exit'

 if [ "$user_input" == "exit" ];
   then

           echo "exiting ther interactive explore . Goodbye"

         break

 fi
# part 2

while true;
do
read -p "enter  a line of text (press enter without text to exit) : " input

# exit if the user enters an empty string

if [ -z "$input" ];
then
        echo "exiting the interacitve explorer. Goodbye"
        break 2 # break out of both loops
fi

char_count=$(echo -n "$input" | wc -m)
echo "character count : $char_count"
  done
done
