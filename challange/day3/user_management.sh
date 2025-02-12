#!/bin/bash



show_help() {

     echo "Usage: $0 [options]"
     echo "Options:"
     echo " -c, --create  Create a new user account"
     echo " -d, --delete  Delte an existing  user account"
     echo " -r, --reset   Reset the password of an existing user account"
     echo " -l, --list    List all user accounts"

     echo " -h, --help    Display the help message"


}

create_account() {



    read -p "Enter new username: " username
    read -sp "Enter password: " password
    echo # To move to the next line after password input

    # Check if the username already exists

    if id "$username" $>/dev/null; then




                echo "Username "$username" is already taken. Pleade choose a differnet username."

                exit 1

    fi



    if sudo useradd -m -p "$(openssl passwd -1 "$password")" "$username"; then
        echo " acoount created succesfullly for username: " "$username"
    else
        echo "Failed to create account for username: "$username" "

        exit 1
    fi



}





delete_account() {


        read -p "enter username to delete : " username

        if ! id "$username" &>/dev/null; then
                echo "username "$username" does not exist."
                exit 1
        fi


        if sudo userdel -r "$username" ; then
                echo "account deleted successfully for username: "$username" "
        else
                echo "failed to delete account for username : "$username" "
                exit 1
        fi







}


reset_password() {



        read -p "enter the username to reset password: " username

        if ! id "$username" &>/dev/null; then
                echo "Username "$username" doest not exist"
                exit 1
        fi


        read -sp "enter the new password: " password
        echo


        if echo "$username:$(openssl passwd -1 "$passwd")" | sudo chpasswd; then

           echo "Password reset successfully for username : "$username" "
        else
           echo " Failed to reset password for username : "$username" "
           exit 1
        fi



        }

list_accounts() {


        echo "User accounts on the system"

        awk -F: '{ print $1, $3 }' /etc/passwd
}



if [[ "$#" -eq 0 ]] ; then
        show_help
        exit 1

fi

case "$1" in
        -c|--create)
                create_account
                ;;


        -d|--delete)
                delete_account
                ;;

        -r|--reset)
                reset_password
                ;;

        -l|--list)
                list_accounts
                ;;
        -h|--show_help)
                show_help
                ;;


        *)
                echo "Invalid option."

                show_help
                exit 1

                ;;


esac




