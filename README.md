# Scripts

DoodlesEpic/Scripts is a guide and a collection of scripts with stuff I like to do on my systems to have them easy to use, fast, secure, and most of all: consistent.

## What this is

By running these scripts, you will get a system with zsh and oh-my-zsh with very useful plugins and sane defaults.

You will also have a lot of environment variables that will make sure your home folder (mostly) follows the XDG specification.

And even better: all of your environment variables will be on POSIX-compliant .profile, which means it gets to be sourced by bash and zsh without duplicating the environment variables.

## Setting up a new machine with Fedora

- Install Fedora using Fedora Media Writer
- Enable LUKS on installation, use a passphrase
- Update packages
- Put .profile on the home folder
- Put .bashrc on the home folder
- Put .zshrc on the home folder
- Set up zsh shell and oh-my-zsh
- Download the oh-my-zsh plugins listed in the .zshrc file
- Set up Brave browser
- Configure Bitwarden with strict configs
- Download the xdg-ninja script
- Set up sync with mega-sync
- Grab gnome-shell-extension-dash-to-dock through dnf
- Grab gnome-shell-extension-appindicator through dnf
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
