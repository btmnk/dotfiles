# vim -> nvim
if nvim --version &> /dev/null
then
	alias vim=nvim
fi

# kubectl
if kubectl version &> /dev/null
then
	alias k=kubectl
fi

# git branch prefix
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias sudo='sudo '

# pnpm
alias p=pnpm

# Takes all merged local branches and soft deletes them
alias git:clean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

# docker start
alias dosta='sudo service docker start'
