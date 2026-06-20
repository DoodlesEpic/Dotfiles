# Scripts

This repository is a guide and a collection of scripts with stuff I like to do on my systems to have them easy to use, fast, secure, and most of all: consistent. It also of course includes my dot files, as the names suggests. You might be interested in this if you like Fedora, Wayland, Freedesktop and zsh.

<img width="1186" height="625" alt="My system's neofetch" src="https://github.com/user-attachments/assets/5dad2014-d7f7-416f-97b7-445580b8cb01" />
<img width="1920" height="1080" alt="Screenshot" src="https://github.com/user-attachments/assets/6d167f57-122b-4106-b17d-49c10efbc298" />

## What this is

By running these scripts, you will get a system with zsh and oh-my-zsh with very useful plugins and sane defaults.
You will also have a lot of environment variables that will make sure your home folder (mostly) follows the XDG specification.
Also, a few environment variables that will make, so applications prefer using Wayland over XWayland (this includes Qt, GTK and Java applications and Firefox).
By default, the script also installs NVidia drivers. Make sure to remove it from the script before running if you're also running AMD or Intel GPUs like I do.

And to top it off: all of your shell environment variables will be on POSIX-compliant .profile, which means it gets to be sourced by bash and zsh without duplicating the environment variables. Other environment variables are stored using Freedesktop's [environment.d](https://www.freedesktop.org/software/systemd/man/environment.d.html) so that they [are loaded by the desktop environment](https://wiki.archlinux.org/title/environment_variables#Wayland_environment).

## Setting up a new machine with Fedora

### Initial installation

- Install Fedora using Fedora Media Writer
- Enable LUKS on installation, use a passphrase
- Update packages
```bash
sudo dnf update -y # reboot if you are not on the latest kernel
```

### Software repositories

- Add the [RPM fusion free and non-free repos](https://rpmfusion.org/Configuration/)
```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
```bash
sudo dnf groupupdate core
```

- Add the [Flathub Fedora Selection repository](https://flatpak.org/setup/Fedora)
```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

### Set up drivers multimedia

- Install RPM fusion multimedia stuff 
```bash
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```
```bash
sudo dnf groupupdate sound-and-video
```

- Add the [NVIDIA VGA drivers from RPM fusion](https://rpmfusion.org/Howto/NVIDIA) before adding any GUIs
```bash
sudo dnf update -y # and reboot if you are not on the latest kernel
```
```bash
sudo dnf install akmod-nvidia # rhel/centos users can use kmod-nvidia instead
```
```bash
sudo dnf install xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support
```

### Adding dot files

- Put .profile on the home folder
- Put .bashrc on the home folder
- Put .zshrc on the home folder

### Setting up zsh

- Set up zsh shell
```bash
sudo dnf install zsh
```
```bash
chsh -s $(which zsh)
```
- Set up oh-my-zsh framework
```bash
ZSH="~/.config/zsh/oh-my-zsh" sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
- Download the oh-my-zsh plugins listed in the .zshrc file
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/zsh/oh-my-zsh/custom}/plugins/zsh-autosuggestions 
```
```bash
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.config/zsh/oh-my-zsh/custom}/plugins/zsh-history-substring-search
```
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.config/zsh/oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
- Download [fzf](https://github.com/junegunn/fzf) for better history reverse search
```bash
sudo dnf install fzf
```

#### Create the history file

By default, since we change where we store the history file we have to actually create the directory, and for good measure the file, otherwise every time we start zsh the history will be empty.

```bash
mkdir $XDG_STATE_HOME/zsh
```
```bash
touch $XDG_STATE_HOME/zsh/history
```


### Setting up other applications

- Configure Bitwarden with strict configs
- Download the [xdg-ninja script](https://github.com/b3nj5m1n/xdg-ninja)
- Set up sync with mega-sync
```bash
wget https://mega.nz/linux/repo/Fedora_43/x86_64/megasync-Fedora_43.x86_64.rpm
```
```bash
sudo dnf install megasync-Fedora_43.x86_64.rpm
```
```bash
rm megasync-Fedora_43.x86_64.rpm -f
```

### Making GNOME usable

- Grab gnome-shell-extension-dash-to-dock through dnf
```bash
sudo dnf install gnome-shell-extension-dash-to-dock.noarch
```
- Grab gnome-shell-extension-appindicator through dnf
```bash
sudo dnf install gnome-shell-extension-appindicator.noarch
```
- Grab gnome-shell-extension-blur-my-shell through dnf
```bash
sudo dnf install gnome-shell-extension-blur-my-shell.noarch
```

#### GNOME extensions

- Grab both the GNOME extensions (or Extension Manager by Matthew Jakeman) and GNOME tweaks through GNOME software
- Open GNOME extensions and use it to enable app indicator support, dash to dock and blur my shell
- Make sure to use magic autohide and system theme on dash to dock so that it doesn't look awful
- Set up blur-my-shell to stop conflicting with dash to dock

#### GNOME tweaks

- Use GNOME tweaks to set the mouse acceleration profile to flat.
- Use GNOME tweaks to add megasync to startup applications
- Use GNOME tweaks to center new windows

### Extra

#### Space usage

- Limit Linux kernel installations to 2 to reduce space usage:
`sudoedit /etc/dnf/dnf.conf`
`installonly_limit=2`

#### Icon theme

- I have really like the Numix Icons Circle theme recently and have been using it as a substitute to the Adwaita icon theme because I believe it's more consistent. The reason I choose it over Talo is because it's available through the repos
```bash
sudo dnf install numix-icon-theme
```
- Enable it through GNOME tweaks

## To-do

These are all the things I want to eventually do but didn't have the time for yet or may be hard

- Have XDG environment variables for all programs commonly used
  - Fix the mess from the installation of rust cargo, NVM, and other curl | sh installed applications (almost done)
- Have a one-liner script that does it all, or almost all
  - Have a graphical user interface that allows the system setup fast and easy, similar to [Chris Titus's script for Windows](https://github.com/ChrisTitusTech/win10script)
- systemd-resolved DNS setup for ad blocking and better privacy using NextDNS, or similar
  - /etc/hosts/ setup for ad blocking and better privacy (if I find a block list that works 99.99% of the time)
- Guide for setting up the [libadwaita for GTK theme](https://github.com/lassekongo83/adw-gtk3) to improve system cohesion
