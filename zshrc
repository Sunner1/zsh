source ~/.zsh/antigen/antigen.zsh

export TERM=xterm-256color
# Python
export WORKON_HOME=$HOME/.virtualenvs
source ~/.virtualenvs/virtualenvwrapper.sh

# Fix stupid zsh stuff
CASE_SENSITIVE="true"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle ruby
antigen bundle python
antigen bundle virtualenv
antigen bundle vagrant

# Other
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle bobthecow/git-flow-completion

# Antigen theme
antigen theme robbyrussell

# Antigen done
antigen apply

# Other configuration
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%d> %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}'
[[ -n $VIRTUAL_ENV ]] && RPROMPT='%{$fg[green]%}$(basename $VIRTUAL_ENV)%'
setopt nocdablevars
setopt noautocd
setopt nosharehistory
setopt autolist
unsetopt menucomplete

export PATH="/opt/java/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:~/Bin:~/.rvm/bin"
# RVM shit
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# OS specific stuff
if [ "$(uname)" = "Darwin" ]
then
    alias vi='vim'
    eval "$(pyenv init -)"

elif [ "$(uname)" = "Linux" ]
then
fi


# Puppet stuff
alias pvalidate='puppet parser validate'
alias pgenerate='puppet module generate --skip-interview'
alias pminstall='puppet module install'
alias puppet-lint='puppet-lint --no-80chars-check --no-class_inherits_from_params_class-check --no-autoloader_layout-check'
alias erbout="erb -P -x -T '-'"
alias plint_all='for i in `ls -1 *.pp`; do echo File $i; puppet-lint $i; done'
alias pval_all='for i in `ls -1 *.pp`; do echo File $i; puppet parser validate $i; done'

# Misc
alias cc_search="egrep '(^|[[:space:]])[456][[:digit:]]{3}((-|[[:space:]])?[[:digit:]]{4}){3}([[:space:]]|$)'"

# Laziness stuff
alias mkdatedir='mkdir $(date +%Y-%m-%d)'
alias sshkey-rm='ssh-keygen -f "/home/sunner/.ssh/known_hosts" -R'

setopt BEEP BASH_AUTOLIST NO_MENUCOMPLETE

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
