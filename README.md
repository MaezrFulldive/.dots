# Bare Git .dotfiles
These are my beautiful dotfiles ◝(ᵔᗜ ᵔ)◜

### Requirements
```
sudo pacman -S git ssh

sudo pacman -S --needed base-devel git
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -S bat tofi mangowc figlet-fonts python-terminaltexteffects

sudo pacman -S mako foot helix ttc-iosevka ttf-iosevkaterm-nerd rofi figlet 
```

### Install
```
# Fresh install
git clone --bare user@server:~/git/.dots.git ~/.dots
alias dots='git --git-dir=$HOME/.dots --work-tree=$HOME'
dots checkout
```

### #TODO
- [ ] create a quickshell widgets thing
- [ ] get mako set up for notifications
- [ ] replace rofi with tofi
- [ ] finalize keyboard shortcuts
- [ ] make startup sequence with keyboard

