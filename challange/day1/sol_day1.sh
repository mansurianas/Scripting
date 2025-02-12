#!/bin/bash

set -x

# ==================== task 1 ==========

# comment is used to disable certain line of code


#=================== task 2 ================



echo "this  side anas .  we are learning bash script. "


#=================== task 3 ================


# variables


variable1="Mansuri"
variable2="Anas"


echo "greeting , $varaible1 $variable2 - welcome to bash world  "


#=================== task 4 ================


num1=2
num2=4

echo "the sum of $num1 and $num2 is: $((num1 + num2))"


#=================== task 5 ================



# using built-in variables


echo "Script name : $0"

echo "Current user  : $USER"

echo "Home directory : $HOME"

echo "Process ID : $$"


echo "Bash version : $BASH_VERSION"

echo "Current shell : $SHEll"



#============================= task 6 =============



# wild cards




echo "list all .txt files in the current directory :"
ls *.txt
