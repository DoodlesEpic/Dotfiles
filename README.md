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
- Use chsh to set zsh as the default shell for the user
- Set up Brave browser
- Configure Bitwarden with strict configs
- Download the xdg-ninja script
- Set up sync with mega-sync

## TODO

These are all the things I want to eventually do but didn't have the time for yet or may be hard

- Have XDG environment variables for all programs
- Have a one-liner script that does it all, or almost all
- Fix the mess from the installation of rust cargo, nvm, and other curl | sh installed applications (almost done)
- systemd-resolved DNS setup for adblocking and better privacy using NextDNS, or similar
- /etc/hosts/ setup for adblocking and better privacy (if I find a blocklist that works 99.99% of the time)
