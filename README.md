## Introduction

This repository is made to customize an installation based in RLC 22.04.

If you are using an nvidia graphic card install its kms drivers first


## How to use this repo as for Home dotfiles

The key to making this work is a one-byte *.gitignore* file:

```
*
```

With this line, and git will ignore all of the files in my $HOME directory, so I needn’t worry about leaving personal files, music, videos, other git repositories, and so on, in my public dotfiles repo. But, in order to track anything at all, we need to override the gitignore file on a case-by-case basis with git add -f, or --force. To add my vimrc, I used the following command:

```
git add -f .vimrc
```

Then I can commit and push normally, and .vimrc is tracked by git. The gitignore file does not apply to any files which are already being tracked by git, so any future changes to my vimrc show up in git status, git diff, etc, and can be easilly committed with git commit -a, or added to the staging area normally with git add — using -f is no longer necessary. Setting up a new machine is quite easy. After the installation, I run the following commands:

```
cd ~
git init
git remote add origin git@github.com:cc250080/dotfiles.git
git fetch
git checkout -f main
```

However, not all of my computers are configured equally. Some run different Linux distributions, or have different concerns being desktops, servers, laptops, etc. It’s often useful for this reason to be able to customize my configuration for each host. For example, before $HOME/bin in my $PATH, I have $HOME/bin/$(hostname). To customize my sway configuration to consider the different device configurations of each host, I use the following directive in ~/.config/sway/config:

```
include ~/.config/sway/`hostname`
```
The same strategy is used for i3


## Basic tool installation

apt install kitty tmux neovim sway swaybg swayidle swaylock pavucontrol docker.io tmux parcellite pasystray fonts-font-awesome neofetch fonts-jetbrains-mono fonts-cascadia-code fonts-firacode pavucontrol i3 nitrogen maim lxappearance fonts-roboto fonts-roboto-fontface fonts-roboto-slab python3-xstatic-roboto-fontface fonts-hack-web fonts-hack fonts-hack-otf fonts-hack-ttf fonts-hack-web nfs-common moc newsboat i3blocks isag

## XORG 

### i3

To use i3 first we install the ubuntu metapackage i3, then, we update it from the official i3 ppa:

https://i3wm.org/docs/repositories.html

```
$ /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
$ sudo apt install ./keyring.deb
$ echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
$ sudo apt update
$ sudo apt install i3
```

### Alacritty

Ubuntu does not have alacritty in its repos, for that we setup the following ppa: 

```
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty
```
The theme we use for alacritty is catpuccin, to install it, run:

```
git clone https://github.com/catppuccin/alacritty.git ~/.config/alacritty/catppuccin
```

And the font is fira code, which is already installed from previous steps.

The whole alacritty config is kept as basic as possible

### Wallpaper/Background

To set the wallpaper you can use feh or nitro, nitro is easier in multi screen setups like mine. Since the whole color theme is going to be capputcino I am using wallpapers that follow this colors theme.

You can find them in .local/wallpapers

### GTK Theme, Icons and Mouse Cursor

I use lxappearance tool to easily set the widgets and Icons to Yaru-purple-dark and the mouse cursor theme to redglass.

Useful resources to control mouse size:

https://gist.github.com/rameezk/aa979a0a73ce26ba62320875d4f57f14
https://wiki.archlinux.org/title/Cursor_themes

### Windows Compositor

to have VSync enabled to have a tear free experience and enable blurred transparency in Alacritty, we use picom. The best option is to build it from source, just follow the instructions here:
https://github.com/tryone144/picom/tree/feature/dual_kawase

### Setup of Starship

```
apt-get install fonts-firacode
curl -sS https://starship.rs/install.sh | sh
```
Add the following to the end of .bashrc (already in the repo)

```
eval "$(starship init bash)"
```

### NVIM

Install a newovim >0.8 from a ppa

Install nvim.packer plugin manager.

### Music

moc/mocp as CLI music player, configuration file in .moc


### i3bar

I like to keep things simple, so I try to do not install a new bar for my i3wm. Nevertheless what I do is to use i3blocks to configure the default bar outputs.

https://github.com/vivien/i3blocks

My basic collection of i3blocks scripts is in .config/i3blocks

The good thing of i3blocks is that it works the same way for Sway.

