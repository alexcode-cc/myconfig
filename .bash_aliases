# Usefully aliases
echo bash_aliases loading...
alias services="systemctl list-unit-files --type=service --state=enabled"
alias passtest="ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no  $*"
alias venv="source .venv/bin/activate"
alias publicip="curl -s4 https://ifconfig.co || curl -s4 https://api64.ipify.org"
alias bconfig="vim ~/.bashrc"
alias breload="source ~/.bashrc"
alias baconfig="vim ~/.bash_aliases"
alias bareload="source ~/.bash_aliases"
alias vconfig="vim ~/.vimrc"k
alias gconfig="vim ~/.gitconfig"
alias gitignore="vim .gitignore"
alias vin="vim +NERDTree"
alias vig="vim +NERDTree Gemfile"
alias rmnode="npx rimraf ./node_modules/"
alias rvminfo="rvm list && rvm gemset list"

# System Aliases
alias h="history"
update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && autoclean -y"
alias upkey="sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $1"
alias checklogin="cat /var/log/auth.log | grep 'Invalid user' | more"
alias nginxstop="sudo systemctl stop nginx && sudo systemctl status nginx"
alias nginxstart="sudo systemctl start nginx && sudo systemctl status nginx"
alias nginxrestart="sudo systemctl restart nginx && sudo systemctl status nginx"

# Nodes Aliases
alias n16="nvm use 16.20.2"
alias n18="nvm use 18.20.8"
alias n20="nvm use 20.18.0"
alias n22="nvm use 22.22.0"
alias n24="nvm use 24.13.0"

# WSL Aliases
alias cpwsl="cp -v $1 $WSLHOME/share/$1"
alias cdwsl="cd $WSLHOME"

# Docker Aliases
alias dock="sudo docker $@"
alias dockps="sudo docker ps -a"
alias dockrmimages="sudo docker image ls -q | xargs -I {} sudo docker image rm -f {}"
alias dockrmcontainers="sudo docker container ls -a -q | xargs -I {} sudo docker rm -f {}"
alias dockrmnetwork="sudo docker network prune"
alias dockrmvolume="sudo docker volume prune"
alias dockrmvolumes="sudo docker volume ls -q | xargs -I {} sudo docker volume rm -f {}"
alias dockcontainers="sudo docker container ls"
alias dockinfo="sudo docker container ls -a && sudo docker image ls && sudo docker volume ls && sudo docker network ls"
alias dockcontainers="sudo docker container ls"
alias dockimages="sudo docker image ls"
alias docknetworks="sudo docker network ls"
alias dockvolumes="sudo docker volume ls"
alias dockercp="sudo docker exec -ti $1 cp $2 $3"
alias dockprune="sudo docker system prune && sudo docker volume prune"
alias showports="sudo ss -ltnp"
alias dockexport="echo sudo docker export id -o image.tar"
alias dockcopy="echo sudo docker cp id:. LocalFolderName"
alias dockup="sudo docker compose up $@"
alias dockupdev="sudo docker compose -f compose-dev.yaml up $@"
alias dockupst="sudo docker compose -f compose-staging.yaml up $@"
alias dockdown="sudo docker compose down $@"
alias dockpsall="sudo docker ps -a -s"
#alias dockstopall='sudo docker stop "$(sudo docker ps -a -q)"'
alias dockstopall="echo 'sudo docker stop' '$''(sudo docker ps -a -q)'"
alias dockremoveall="echo 'sudo docker rm' '$''(sudo docker ps -a -q)'"
alias dockremoveimages="echo 'sudo docker rmi' '$''(sudo docker images -a -q)'"
alias dockremovevolumes="echo 'sudo docker volume rm ''$''(sudo docker volume ls -q)'"
alias dockimages="sudo docker images -a"
alias docklsall="echo '--- containers ---' && sudo docker container ls && echo '--- images ---' && sudo docker image ls && echo '--- networks ---' && sudo docker network ls && echo '--- volumes ---' && sudo docker volume ls"
alias dockprunecontainer="sudo docker container prune"
alias dockpruneimage="sudo docker image prune"
alias dockprunenetwork="sudo docker network prune"
alias dockprunevolume="sudo docker volume prune"
alias dockpruneall="sudo docker system prune --all"

#alias dockcmd="echo dockup, dockdown, dockinfo, dockpsall, dockstopall, dockremoveall, dockremoveimages, dockremovevolumes, dockimages, dockcontainer, dockimage, docknetwork, dockvolume, dockpruneconatainer, dockpruneimage, dockprunenetwork, dockprunevolume, dockpruneall, docklsall"

#alias dockhelp="echo dockup: docker-compose up, dockdown: docker-compose down, dockinfo: docker info, dockpsall: ps all containers, dockstopall: stop all containers, dockremoveall: remove all containers, dockremoveimages: remove all images,  dockremoveimages: remove all volumes, dockimages: all images, dockcontainer: ls container, dockimage: ls image, docknetwork: ls network, dockvolume: ls volume, dockprunecontainer: prune all container, dockpruneimage: prune all image, dockprunenetwork: prune all network, dockprunevolume: prune all volume, dpruneall: system prune all, docklsall: ls all resources"

#alias dockshell="sudo docker exec -it `./container_name` bash"

echo bash_aliases loaded.

