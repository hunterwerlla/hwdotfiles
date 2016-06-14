#
# ~/.bashrc
#
alias ls='ls --color=auto'
alias psc='ps xawf -eo pid,user,cgroup,args'
alias phex="hexdump -v -e '\"%010_ad  |\" 16/1 \"%_p\" \"|\n\"'"
alias yum='dnf'

PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\];)\"; else echo \"\[\033[01;31m\];(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$\[\033[00m\] "
export "PYTHONSTARTUP=~/.pyrc"
export "TERM=xterm-256color"
export "LIBDIR=/usr/local/lib"
export PATH=$HOME/Programs/Go:${PATH}
export "JAVA_HOME=JAVA_HOME=/usr/lib/jvm/jre-openjdk"
export "GOPATH=/home/hunter/Development/Go/"
export "GOBIN=/home/hunter/Programs/Go/"
# >>>>BEGIN ADDED BY CNCHI INSTALLER<<<< #
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano
# >>>>>END ADDED BY CNCHI INSTALLER<<<<< #
