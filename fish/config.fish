set LC_All en_US.UTF-8
set LANG en_US.UTF-8

if test "$EMACS" = ""
   set TERM xterm-256color
end

set -x PATH $PATH /sbin/
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH $HOME/.local/bin

# Python
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
status --is-interactive; and pyenv init - | source

# Rust
set -x PATH $PATH $HOME/.cargo/bin

# Flutter
set -x PATH $PATH $HOME/dev/flutter/bin
set -x PATH $PATH $HOME/dev/flutter/bin/cache/dart-sdk/bin/

# Haskell
set -x PATH $PATH $HOME/.cabal/bin
set -x PATH $PATH $HOME/.ghcup/bin
set -x PATH $PATH $HOME/.ghcup/env
