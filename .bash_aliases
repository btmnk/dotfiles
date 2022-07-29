if nvim --version &> /dev/null
then
	alias vim=nvim
fi

# kubectl
if kubectl version &> /dev/null
then
	alias k=kubectl
fi

# Takes all merged local branches and soft deletes them
alias git:clean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

