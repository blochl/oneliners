#!/bin/bash

for d in /sys/class/net/*; do name="${d##*/}"; pci="$(readlink -f "${d}/device" | awk -F/ '{print $NF}')"; ! expr "${pci}" : '^....:..:..\..$' &>/dev/null || printf "Name:\t%s\nIP:\t%s\nMAC:\t%s\nPCI:\t%s\n\n" "${name}" "$(ip a | sed -n "/^[0-9]\+: ${name}:/,/^[0-9]/ s/.*inet \([0-9.]\+\).*$/\1/p")" "$(<"${d}/address")" "${pci}"; done
