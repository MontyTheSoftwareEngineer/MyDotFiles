# american flag display
# american flag display
blue_bg="\e[48;2;0;40;104m"
white="\e[38;2;255;255;255m"
red="\e[38;2;255;0;0m"
reset="\e[0m"

printf "${blue_bg}${white}⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ${reset}${red}██████████████████${reset}\n"
printf "${blue_bg}${white}  ⭐ ⭐ ⭐ ⭐ ⭐  ${reset}${white}██████████████████${reset}\n"
printf "${blue_bg}${white}⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ${reset}${red}██████████████████${reset}\n"
printf "${blue_bg}${white}  ⭐ ⭐ ⭐ ⭐ ⭐  ${reset}${white}██████████████████${reset}\n"
printf "${blue_bg}${white}⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ${reset}${red}██████████████████${reset}\n"
printf "${blue_bg}${white}  ⭐ ⭐ ⭐ ⭐ ⭐  ${reset}${white}██████████████████${reset}\n"
printf "${blue_bg}${white}⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ${reset}${red}██████████████████${reset}\n"

printf "${white}████████████████████████████████████${reset}\n"
printf "${red}████████████████████████████████████${reset}\n"
printf "${white}████████████████████████████████████${reset}\n"
printf "${red}████████████████████████████████████${reset}\n"
printf "${white}████████████████████████████████████${reset}\n"
printf "${red}████████████████████████████████████${reset}\n"
#
# enable powerlevel10k instant prompt. should stay close to the top of ~/.zshrc.
# initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# if you come from bash you might have to change your $path.
# export path=$home/bin:/usr/local/bin:$path

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( 
    git
    zsh-autosuggestions
    # fzf plugin removed - using manual source at bottom instead
)

source $ZSH/oh-my-zsh.sh

# display pokemon-colorscripts
# project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
#pokemon-colorscripts --no-title -s -r | fastfetch -c $home/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. will be disabled if above colorscript was chosen to install
#fastfetch -c $home/.config/fastfetch/config-compact.jsonc


# set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"
alias cd="z"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
export PATH=/home/hpham/Qt/6.7.0/gcc_64/bin:/home/hpham/MyDotFiles/scripts:/home/hpham/.nvm/versions/node/v20.19.2/bin/:~/bin:/opt/st/stm32cubeide_1.18.1/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.13.3.rel1.linux64_1.0.0.202410170706/tools/bin:$PATH

#nvm install 20

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # this loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # this loads nvm bash_completion
nvm use 22 --silent



# created by `pipx` on 2025-07-29 14:05:14
export PATH="$PATH:/home/hpham/.local/bin"
# export android_sdk_root=$home/android-sdk
# export path=$android_sdk_root/cmdline-tools/latest/bin:$android_sdk_root/emulator:$android_sdk_root/platform-tools:$path

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
