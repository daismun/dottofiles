# Created by Murasaki
setopt auto_cd
typeset -g -A key

# BUllSHJIT

bindkey "^U"    backward-kill-line
bindkey "^u"    backward-kill-line
bindkey "^[l"   down-case-word
bindkey "^[L"   down-case-word

# alt+<- | alt+->
bindkey "^[f" forward-word
bindkey "^[b" backward-word

# ctrl+<- | ctrl+->
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word


# Aliases {{{
alias move_by_date='for x in */*.jpg; do   d=$(date -r "$x" +%Y-%m-%d);   mkdir -p DATES/"$d";   mv -- "$x" DATES/"$d/"; done'
alias mnt_nya='mkdir ~/Nya && sshfs murasaki@nyarlathotep:$HOME ~/Nya'
alias umnt_nya="fusermount -u ~/Nya && rm -r ~/Nya"
alias vim="nvim"
alias vi="nvim --noplugin"
alias c="calcurse"
alias fix_pulseaudio="pulseaudio --daemonize=no --exit-idle-time=-1"
alias xi="sudo xbps-install -S"
alias xr="sudo xbps-remove -R"
alias xq="sudo xbps-query -Rs"
alias xe="sudo xbps-query -m"
alias xu="sudo xbps-install -Suv"
alias pm="pulsemixer"
alias am="alsamixer"
alias ls="exa -l --icons"
alias cls="clear && ls"
alias sw="sudo poweroff"
alias yt_gaut='yt-dlp --extract-audio --audio-format mp3 --output "%(uploader)s%(title)s.%(ext)s"'
alias yt_gat='yt-dlp --extract-audio --audio-format mp3 --output "%(title)s.%(ext)s"'
alias gethw='(printf "\nCPU\n\n"; lscpu; printf "\nMEMORY\n\n"; free -h; printf "\nDISKS\n\n"; lsblk; printf "\nPCI\n\n"; lspci; printf "\nUSB\n\n"; lsusb; printf "\nNETWORK\n\n"; ifconfig) | less'
alias compress_jpeg="mogrify -format jpeg -quality"
alias compress_videos="echo 'ffmpeg -i input.mp4 -vcodec libx265 -crf 28 output.mp4'"
alias make_montage="echo 'montage -background 'RGB(17,5,44)' -geometry 1200x1200'"
# }}}

# Functions
function cd() {
	builtin cd $@
   ls
}

function mkcd() {
    mkdir -p "$*"
      cd "$*"
	 }


# Completion

zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

# Colored man
man() {
  env \
     LESS_TERMCAP_mb=$(printf "\e[1;31m") \
     LESS_TERMCAP_md=$(printf "\e[1;31m") \
     LESS_TERMCAP_me=$(printf "\e[0m") \
     LESS_TERMCAP_se=$(printf "\e[0m") \
     LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
     LESS_TERMCAP_ue=$(printf "\e[0m") \
     LESS_TERMCAP_us=$(printf "\e[1;32m") \
     man "$@"
}

# Prompt 
PROMPT='%F{3}%n%f@%F{4}%m%f %F{4}%B%~%b%f %# '

# Good stuff
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# vim: fdm=marker:
