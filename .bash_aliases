# private bash aliases
if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi

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

encb64() {
  echo -n $1 | base64
}

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Takes all merged local branches and soft deletes them
alias git:clean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

# docker start
alias dosta='sudo service docker start'

# gradle spring boot run dev
alias bootrun='./gradlew :backend:bootRun --args=--spring.config.name=development'

# git compare
alias gitcmp:stage='git log --no-merges --pretty=format:"%ar%x09%an%x09%x09%Cgreen%s" origin/master..origin/stage'
alias gitcmp:dev='git log --no-merges --pretty=format:"%ar%x09%an%x09%x09%Cgreen%s" origin/stage..origin/development'

