# Usefully aliases
echo bash_aliases loading...
alias bconfig="vim ~/.bashrc"
alias breload="source ~/.bashrc"
alias baconfig="vim ~/.bash_aliases"
alias bareload="source ~/.bash_aliases"
alias vconfig="vim ~/.vimrc"
alias gconfig="vim ~/.gitconfig"
alias gitignore="vim .gitignore"
alias vin="vim +NERDTree"
alias vig="vim +NERDTree Gemfile"
alias h="history"
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
alias rvminfo="rvm list && rvm gemset list"
# WSL Aliases
alias cpwsl="cp -v $1 $WSLHOME/share/$1"
alias cdwsl="cd $WSLHOME"
# Vagrant Aliases
alias alint="ansible-lint $@"
alias vedit="vim Vagrantfile"
alias vhelp="vagrant help"
alias vupp="time vagrant up --provision"
alias vpv="time vagrant provision $@"
alias vup="time vagrant up $@"
alias vdown="vagrant halt $@"
alias vrestart="time vagrant reload $@"
alias vrestartp="time vagrant reload --provision"
alias vstat="vagrant status $@"
alias vgstat="vagrant global-status $@"
alias vssh="vagrant ssh $@"
alias vsshconf="vagrant ssh-config $@"
alias vbox="vagrant box $@"
alias vcloud="vagrant cloud $@"
alias vpause="vagrant suspend $@"
alias vresume="vagrant resume $@"
alias vsnap="vagrant snapshot $@"
alias vvalid="vagrant validate $@"
alias vver="vagrant version $@"
alias vpack="vagrant package --output $@"
alias vboxchecksum="sha256sum $1"
alias vboxadd="vagrant box add --name $1 --checksum-type sha256 --checksum $2 $3"
alias vcmd="echo vedit,vhelp,vupp,vpv,vup,vdown,vrestart,vrestartp,vstat,vgstat,vssh,vsshconfig,vbox,vcloud,vpause,vresume,vsnap,vvalid,vver,vpack,vcmd,vcmdhelp"
alias vcmdhelp="echo edit, help,up -p,provision,,up,halt,reload,reload -p,status,global-status,ssh,ssh-config,box,cloud,suspend,resume,snapshot,validate,version,pack"
echo bash_aliases loaded.

