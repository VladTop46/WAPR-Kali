#!/bin/bash

#Variables
script_name="Windows account password remover"

#Script's header
echo '###################################################'
echo ''
echo $script_name "by VladTop46"
echo ''
echo '###################################################'
echo ''

#Progressbar
echo -ne 'Initializing - [=                      ] (1%)\r'
sleep 1
echo -ne 'Initializing - [=====                  ] (30%)\r'
sleep 1
echo -ne 'Initializing - [===========            ] (50%)\r'
sleep 1
echo -ne 'Initializing - [===============        ] (65%)\r'
sleep 1
echo -ne 'Initializing - [=======================] (100%)\r'
echo -ne '\n'
sleep 1
#Progressbar end

#Script's header end

#Script's body
echo ''
echo 'Please select disk with Windows files ("Microsoft basic data"):'
read d
sleep 1
echo ''
echo 'Selected disk' $d
echo 'Starting script...'
sleep 2

echo 'Unmounting disk' $d'...'
sudo umount $d
sleep 3

echo 'Starting ntfsfix for selected disk...'
sudo ntfsfix $d
sleep 5

echo 'Creating directory...'
sudo mkdir /mnt/windows
sleep 1

echo 'Mounting selected disk...'
sudo mount $d /mnt/windows
sleep 1

echo 'Creating backup of SAM file...'
sudo cp /mnt/windows/Windows/System32/config/SAM /mnt/windows/Windows/System32/config/SAM.bak
sudo cp /mnt/windows/Windows/System32/config/SAM /mnt/windows/Windows/SAM.bak
sleep 1

echo 'All users on this PC, please select one:'
/usr/sbin/chntpw /mnt/Windows/System32/config/SAM -l
read u
echo 'User' $u 'is selected, continue? [Y/N]'
read c

case $c in 
y)
/usr/sbin/chntpw /mnt/Windows/System32/config/SAM -u $u
sleep 1
echo 'Successfully deleted password for' $u
exit 0
;;
n)
echo 'Selected N, stopping script...'
exit 1
;;
*)
echo 'Continue? [Y/N]'
;;
esac

exit 0

#Script's body end
