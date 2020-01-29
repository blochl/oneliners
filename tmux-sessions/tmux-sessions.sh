#!/bin/bash

tmux_ls() { local ls; ls="$(tmux ls 2>/dev/null || :)"; [ -n "${ls}" ] && printf "\n\e[7mActive tmux sessions:\e[27m\n%s\n" "${ls}" || printf "\n\e[7mNo active tmux sessions\e[27m\n"; }; [ -n "${TMUX}" ] || (tmux_ls)
