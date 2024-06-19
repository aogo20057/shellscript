#!/bin/bash
echo
echo "[3. ENV3.sh 실행] 환경 설정"

. ./functions.sh

short_hostname=$(hostname | awk -F. '{print $1}')

#-------PS1 Color--------
export linux200=31
export linux201=32
export linux202=33
#------------------------
# 환경설정
# * PS1 변수(색깔 표시)
#   export PS1='\[\e[31;1m\][\u@\h\[\e[33;1m\] \w]\$ \[\e[m\]'
# * alias ls='ls --color=auto -h -F'
# * alias df='df -hT'
# * alias ...

echo "[1. ($HOME/.bashrc) } 환경 설정"
cat << EOF > $HOME/.bashrc

[[ $- == *i* ]] && source "$HOME/.local/share/blesh/ble.sh" --attach=none
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "\$PATH" =~ "\$HOME/.local/bin:\$HOME/bin:" ]]
then
    PATH="\$HOME/.local/bin:\$HOME/bin:\$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
 
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
export PS1='\[\e[$(eval echo \$${short_hostname});1m\][\u@\h\[\e[33;1m\] \w]\\$ \[\e[m\]'
alias vi='/usr/bin/vim'
alias tree='env LANG=C tree'

alias code='code --no-sandbox --user-data-dir=/root/vscode &'
alias vscode='code'
#
# shell script alias
# 
alias aaa='chmod 755 ~/script/*.sh'

[[ \${BLE_VERSION-} ]] && ble-attach
EOF

cat << EOF
---------------------------------
다음과 같이 환경파일을 적용합니다.
# source ~/.bashrc
---------------------------------
EOF 
