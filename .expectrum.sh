#! /bin/bash
# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/

typeset -ax FX FG BG BOLD GREEN BLUE RED RESET

FX_RESET="\033[0m"
FX_BOLD="\e[1m"
FX_NO_BOLD="\e[21m"
FX_ITALIC="\e[3m"
FX_NO_ITALIC="\e[23m"
FX_UNDERLINE="\e[4m"
FX_NO_UNDERLINE="\e[24m"
FX_BLINK="\e[5m"
FX_NO_BLINK="\e[25m"
FX_REVERSE="\e[7m"
FX_NO_REVERSE="\e[27m"


for color in {000..255}; do
    FG[$color]="\e[38;5;${color}m"
    BG[$color]="\e[48;5;${color}m"
done

SPECTRUM_TEXT=${SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    printf "${FG[$code]}$code: $SPECTRUM_TEXT ${FX_RESET}\n"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    printf "${BG[$code]}$code: $SPECTRUM_TEXT ${FX_RESET}\n"
  done
}

# Default colors
BOLD="${FX_BOLD}"
GREEN="${FG[193]}"
BLUE="${FG[110]}"
RED="${FG[167]}"
RESET="${FX_RESET}"
