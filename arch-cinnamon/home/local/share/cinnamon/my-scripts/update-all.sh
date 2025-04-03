#!/bin/bash
echo ":: Full system and applications update"
echo " "

# update packages
yay
# update flatpak
echo "Starting flatpak update..."
sleep 3
flatpak update
flatpak remove --unused
sleep 3

# exit messages
send-notification "Update completed" "All applications successfully updated"
echo 
echo ":: Update completed."
#sleep 2
