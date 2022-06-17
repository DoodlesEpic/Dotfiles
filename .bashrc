# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Force bash to source .profile
# This guarantees that it can share stuff with zhs and also have its own profile
source ~/.profile

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
. "$XDG_DATA_HOME/cargo/env"

# The next line updates PATH for Netlify's Git Credential Helper.
test -f '/home/doodles/.config/netlify/helper/path.bash.inc' && source '/home/doodles/.config/netlify/helper/path.bash.inc'

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# Store the history file according to xdg 
export HISTFILE="${XDG_STATE_HOME}"/bash/history

