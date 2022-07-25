# Scripts

This repoository is a guide and a collection of scripts with stuff I like to do on my systems to have them easy to use, fast, secure, and most of all: consistent. It also of course includes my dotfiles as the names suggests. You might be interested in this if you like Fedora, Wayland, Freedesktop and Zsh.

![My system's neofetch](https://user-images.githubusercontent.com/37254797/177683255-17c8092a-518a-46ef-bf67-4fb5a4cc15db.png)

## What this is

By running these scripts, you will get a system with zsh and oh-my-zsh with very useful plugins and sane defaults.
You will also have a lot of environment variables that will make sure your home folder (mostly) follows the XDG specification.
Also a few environment variables that will make so applications prefer using wayland over xwayland (this includes Qt, GTK and Java applications and Firefox).

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

### Adding dotfiles

- Put .profile on the home folder
- Put .bashrc on the home folder
- Put .zshrc on the home folder

### Setting up zsh

- Set up zsh shell and oh-my-zsh
- Make sure to put oh-my-zsh config on the .config folder
```bash
ZSH="~/.config/zsh/oh-my-zsh" sh installer.sh
```
- Download the oh-my-zsh plugins listed in the .zshrc file

### Setting up other applications

- Set up Brave browser
```bash
sudo dnf install dnf-plugins-core
```
```bash
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
```
```bash
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
```
```bash
sudo dnf install brave-browser
```
- Configure Bitwarden with strict configs
- Download the [xdg-ninja script](https://github.com/b3nj5m1n/xdg-ninja)
- Set up sync with mega-sync
```bash
wget https://mega.nz/linux/repo/Fedora_36/x86_64/megasync-Fedora_36.x86_64.rpm
```
```bash
sudo dnf install megasync-Fedora_36.x86_64.rpm
```
```bash
rm megasync-Fedora_36.x86_64.rpm -f
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

#### GNOME extensions

- Grab both the GNOME extensions and GNOME tweaks through GNOME software
- Open GNOME extensions and use it to enable both app indicator and dash to dock
- Make sure to use magic autohide and system theme on dash to dock so that it doesn't look awful

#### GNOME tweaks

- Use GNOME tweaks to set the mouse acceleration profile to flat.
- Use GNOME tweaks to add megasync to startup applications
- Use GNOME tweaks to center new windows
- Optionally also set mouse right click to maximize windows horizontally (doesn't work with everything well)

#### Extra

- Limit Linux kernel installations to 2 to reduce space usage:
`sudoedit /etc/dnf/dnf.conf`
`installonly_limit=2`

### Installing oh-my-zsh plugins

I really like the fish shell, but I don't use it because it is not able to run POSIX scripts, it's also just very stupid because it could be able to run posix-compliant scripts if they wanted, that's why we have zsh. A few zsh-users plugins must be installed to have autosuggestions, substring search and syntax highlighting like in fish.

```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```zsh
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```

```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## TODO

These are all the things I want to eventually do but didn't have the time for yet or may be hard

- Have XDG environment variables for all programs
- Have a one-liner script that does it all, or almost all
- Fix the mess from the installation of rust cargo, nvm, and other curl | sh installed applications (almost done)
- systemd-resolved DNS setup for adblocking and better privacy using NextDNS, or similar
- /etc/hosts/ setup for adblocking and better privacy (if I find a blocklist that works 99.99% of the time)
