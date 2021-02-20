#!/bin/bash
 
# Created by: Fredrick Okereke
# Date      : 13/02/2021
# Purpose   : Onboarding users and adding to a specific group, then creating an authorize key file for ssh remote login


clear 


# path to name file
file=names.csv

# default of ssh directory stored in a variable
ssh=/etc/skel/.ssh

# authorized key file in a variable
key=authorized_keys

# Ensure Group has been created manually, then  add and set default user password and group to new user
group='develop'
pass='@Dare123'

# populate skel directory with ssh folder
if [ -d "$ssh" ] ; 
then
    echo
    echo "ssh folder already exist."
    echo
else
    sudo mkdir -p $ssh
    sudo bash -c "echo $key >> $ssh/authorized_keys"
    echo "$ssh directory is now created and ready for use"
    echo 
fi

while IFS= read user
    do
        # check if user already exists
        if [ $(getent passwd $user) ] ;  
        then
            echo " This user - $user already exists."
            echo
        else

            sudo useradd -m -G $group -s /bin/bash $user
            sudo echo -e "$pass\n$pass" | sudo passwd "${user}"
            sudo passwd -x 3 ${user}
            sudo chmod 600 /home/$user/.ssh
            sudo chmod 600 /home/$user/.ssh/authorized_keys
            sudo chown $user /home/$user/.ssh/authorized_keys
            echo "$user created..."
            echo 
        fi
        done < $file && echo "User creation successfully completed."
