#!/bin/bash
 
# Created by: Fredrick Kelly Okereke
# Date      : 13/02/2021
# Purpose   : Onboarding users and adding to a specific group, then creating an authorize key file for ssh remote login
# 
# 
# 

clear 

read -p "Welcome, You are about to onboard users into this system, press 1 or anything else to quit" input


# set name of input data file
file=names.csv


# store name of ssh directory in a variable
ssh=/etc/skel/.ssh

# store name of authorized key file in a variable
key=authorized_keys

# set default user password. will be changed

pass='dare123'

# populate skel directory with ssh folder
if [ -d "$ssh" ] ; 
then
    echo
    echo "ssh folder already exist."
    echo
else
    sudo mkdir -p $ssh
    sudo bash -c "cat $key >> $ssh/authorized_keys"
    echo "$ssh directory is now create and ready for use"
    echo 
fi

while IFS= read user
    do
        # check if user already exists
        if [ $(getent passwd $user) ] ;  
        then
            echo " This user - $user -already exists."
            echo
        else

            sudo useradd -m -G $GROUP_NAME $user
            sudo echo -e "$pass\n$pass" | sudo passwd "${user}"
            sudo passwd -x 3 ${user}
            sudo chmod 755 /home/$user/.ssh
            sudo chmod 755 /home/$user/.ssh/authorized_keys
            echo "$user created..."
            echo 
        fi
        done < $file && echo "User creation successfully completed."
