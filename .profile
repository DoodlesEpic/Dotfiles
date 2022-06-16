# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Environment variables for XDG
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# Source cargo environment
. "$HOME/.local/share/cargo/env"
. "$XDG_DATA_HOME/cargo/env"

# More environment variables for applications that don't use XDG by default
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_DATA_HOME"/cabal
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export ANDROID_HOME="$XDG_DATA_HOME"/android
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export ZDOTDIR=$HOME/.config/zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
