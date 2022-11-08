# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#source /home/s4vitar/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Manual configuration

PATH=/root/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='batcat'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-sudo/sudo.plugin.zsh

# Functions
function mkt(){
	mkdir {nmap,content,exploits,scripts}
}

# Extract nmap information
function extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}

# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

# fzf improvement
function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}

function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}

# Finalize Powerlevel10k instant prompt. Should stay at the bottom of ~/.zshrc.
(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize
source ~/powerLevel10k/powerlevel10k.zsh-theme

# Custom Andoni
alias cls='clear'
alias up='sudo apt update -y'
alias upg='sudo apt upgrade -y'
alias bye='shutdown now'
alias catn='/bin/cat'
alias aliasll="clear && grep -A10000 Andoni ~/.zshrc"
alias bins="cd ~/Documentos/scripts/bash/"
alias winbox="wine ~/winbox/winbox64.exe &"
alias net_r="sudo systemctl restart NetworkManager"
alias burp='/home/andoni/BurpSuiteCommunity/BurpSuiteCommunity'
alias exploit='/home/andoni/exploit-database/searchsploit'
alias hack='cd /home/andoni/Documentos/hacking'
alias adr='java -jar /usr/local/bin/pilar.jar'
alias la='ls -la'
alias alldown='sudo systemctl stop ufw && sudo iptables -F'
alias vpn_ecotisa_up='nmcli con up id Ecotisa --ask'
alias vpn_ecotisa_down='nmcli con down id Ecotisa'
alias notes='/home/andoni/notes/Obsidian-0.15.9.AppImage &'

# Servers Cloud
alias grafana="ssh -p 12221 andoni@ecoicloud.es"
alias odoo="ssh -p 11222 andoni@ecoicloud.es"
alias ecoprint="ssh -p 22211 root@ecoicloud.es"
alias ecoking="ssh -p 12221 ecoking@ecoicloud.es"
alias cloud='ssh -p 22122 sistemas@ecoicloud.es'
alias cloudscp='{ IFS= read -r p && scp -P 22122 "$p" sistemas@ecoicloud.es:; } <<<'
alias grafana='ssh -p 22222 sistemas@ecoicloud.es'

# Servers Ecotisa
alias asterisk='ssh -i ~/.sysadmin.key root@192.168.2.10'
alias pasterisk='ssh -p 22122 sistemas@192.168.2.11'
alias kraken='ssh -p 22122 sistemas@192.168.2.89'
alias server_robots='ssh -p 22122 sistemas@192.168.2.171'

# Custom System
#./.screenlayout/defaultLayer.sh
alias ccat="/bin/cat"
alias ssh="kitty +kitten ssh"
alias htb="cd /home/andoni/documents/htb/"
alias ceh="cd /home/andoni/documents/ceh/"

# Custom fail2ban aliases:
alias banned="fail2ban-client status sshd"
alias unbann="fail2ban-client set sshd unbanip"

# Servers ERP
alias erp_cerasusviejito='ssh -p 22122 andoni@51.210.247.13'
alias erp_rrhh="ssh -p 22122 andoni@146.59.235.103"
alias erp_ecotisa="ssh -i ~/.ssh/sysadmin.key root@192.168.2.23"
alias erp_coenyco='ssh -p 22122 andoni@51.38.177.102'
alias erp_cerasus='ssh -p 22122 andoni@193.70.84.63'
alias erp_rivas='ssh sistemas@137.74.106.137'
alias erp_winkle='ssh -p 22122 andoni@135.125.103.116'
alias erp_mpf='ssh -p 22122 sistemas@5.196.27.250'
alias erp_plusultra='ssh -p 22122 sistemas@37.187.198.75'
alias erp_cerasusfinal='ssh -p 22122 sistemas@5.196.224.156'
alias erp_ecogestion='ssh -p 22122 sistemas@193.70.91.156'
alias erp_onepool='ssh -p 22122 sistemas@54.36.100.162'

# Server Hosting
alias server_ecotisa.com="ssh -p 22122 andoni@207.180.227.201"
alias server_oceanic="ssh -p 22122 andoni@91.142.214.223"
alias server_ecoitecback2='ssh -p 22122 andoni@188.164.193.184'
alias server_buffettest='ssh -p 22122 andoni@51.77.211.204'
alias server_mipequeñafabrica='ssh -p 790 andoni@149.62.168.231'
alias server_azpiazu='ssh andoni@91.142.214.190'
alias server_as9team='ssh andoni@91.142.214.237'
alias server_dnsecoitec='ssh -p 22122 sistemas@188.164.193.111'
alias server_ecoitecback='ssh -p 790 andoni@91.142.218.57'
alias server_whitevoid='ssh -p 790 andoni@149.62.172.159'
alias server_front='ssh -p 22122 sistemas@192.168.5.193'
alias server_rivasnuevo='ssh -p 22122 sistemas@141.94.247.5'
alias server_maikioncerasus='ssh -p 22122 sistemas@51.210.177.82'
alias server_configuracion='ssh -p 22122 sistemas@141.95.159.38'
alias server_ecogestion2='ssh -p 22122 sistemas@141.95.159.39'
alias server_server='ssh -p 22122 sistemas@51.210.177.82'
alias server_ubuntu='ssh -p 22122 sistemas@141.95.159.38'
alias server_servidor='ssh -p 22122 sistemas@37.187.37.13'
alias server_VPSEcoitec='ssh -p 22122 andoni@94.127.187.114'
alias server_cerasuslocal='ssh -p 2223 sistemas@192.168.2.222'
alias server_snort='ssh -p 22122 sistemas@192.168.5.7'
