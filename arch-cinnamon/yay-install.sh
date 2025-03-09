echo ":: YAY :: INSTALL"
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-git.git ~/yay-git
cd ~/yay-git || exit
makepkg -si
