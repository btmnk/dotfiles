if nvim --version &> /dev/null
then
	alias vim=nvim
fi

# Takes all merged local branches and soft deletes them
alias git:clean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

