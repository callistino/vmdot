#! /bin/bash
# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/

declare -Ax FX FG BG BOLD GREEN BLUE RED RESET

FX=(
    [reset]="\e[0m"
    [bold]="\e[1m" [no-bold]="\e[21m"
    [italic]="\e[3m" [no-italic]="\e[23m"
    [underline]="\e[4m" [no-underline]="\e[24m"
    [blink]="\e[5m" [no-blink]="\e[25m"
    [reverse]="\e[7m" [no-reverse]="\e[27m"
)

for color in {000..255}; do
    FG[$color]="\e[38;5;${color}m"
    BG[$color]="\e[48;5;${color}m"
done


ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    echo -e "$code: ${FG['$code']}$ZSH_SPECTRUM_TEXT ${FG[reset]}"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    echo -e "${BG[$code]}$code: $ZSH_SPECTRUM_TEXT ${FX[reset]}"
  done
}

# Default colors
BOLD="${FX[bold]}"
GREEN="${FG[120]}"
BLUE="${FG[110]}"
RED="${FG[167]}"
RESET="${FX[reset]}"
