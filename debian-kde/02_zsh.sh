#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)
fonts_dir="/home/$username/.fonts"

cd "$builddir" || exit

sudo nala update

### zsh terminal
sudo nala install zsh -y
sudo chsh -s /usr/bin/zsh

### oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### get plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
### copy zsh files
cp zsh/*-nermin.zsh-theme /home/"$username"/.oh-my-zsh/themes/
cp zsh/.zshrc /home/"$username"/

# copy fonts
mkdir -p "$fonts_dir"
cp -a "$builddir"/fonts/MesloLGS "$fonts_dir"
# refresh font cache
sudo fc-cache -f -v
fc-cache -f -v

chown -R "$username":$username /home/$username


# see: https://github.com/romkatv/powerlevel10k#getting-started
#echo 'Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc'

# restart zsh
/usr/bin/zsh




