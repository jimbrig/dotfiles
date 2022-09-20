#!/usr/bin/env bash

DOTDIR="$HOME/.dotfiles"

zshrc() {
    echo "==========================================================="
    echo "             cloning zsh-autosuggestions                   "
    echo "-----------------------------------------------------------"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "==========================================================="
    echo "             cloning zsh-syntax-highlighting               "
    echo "-----------------------------------------------------------"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "==========================================================="
    echo "             cloning zsh-completions                       "
    echo "-----------------------------------------------------------"
    git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
    echo "==========================================================="
    echo "             cloning powerlevel10k                         "
    echo "-----------------------------------------------------------"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo "==========================================================="
    echo "             import zshrc                                  "
    echo "-----------------------------------------------------------"
    cp $DOTDIR/zsh/.zshrc $HOME
    echo "==========================================================="
    echo "             import powerlevel10k                          "
    echo "-----------------------------------------------------------"
    cp zsh/.p10k.zsh $HOME
}

# change time zone
# timedatectl set-timezone America/New_York
sudo ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
sudo dpkg-reconfigure --frontend noninteractive tzdata

zshrc

# install homebreww


# make directly highlighting readable - needs to be after zshrc line
# echo "" >> ~/.zshrc
# echo "# remove ls and directory completion highlight color" >> ~/.zshrc
# echo "_ls_colors=':ow=01;33'" >> ~/.zshrc
# echo 'zstyle ":completion:*:default" list-colors "${(s.:.)_ls_colors}"' >> ~/.zshrc
# echo 'LS_COLORS+=$_ls_colors' >> ~/.zshrc