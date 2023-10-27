# System

## Prerequisites
```{bash}
sudo apt install zsh unzip make fasd python3
```

`sudo apt install rcm yarnpkg cmake golang npm curl inotify-tools`

## Start
```
git clone --recurse-submodules https://github.com/Yann21/system.git
./install.sh
```

## Finishing touches
`sudo apt install fzf conda fasd bat python3-venv libnotify-bin`


## Problems
- home/users/yahoffmann/.vim/plugged/YouCompleteMe/install.py: No such file or directory

- command -v exa: shows alias even if executable doesn't h
- Create user not root
- Add ~/.local/bin to PATH
- omz_plugins.sh not working with the env variables

Ansible
- dotfiles make run will block when asking to overwrite ~/.profile
- Same with vim
- ohmyzsh line is creating a zsh shell and stopping the install script
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
- adcpmv takes a shit long time


## GUI Problems
- Add native messenger to install script
curl -fsSl https://raw.githubusercontent.com/tridactyl/native_messenger/master/installers/install.sh -o /tmp/trinativeinstall.sh && sh /tmp/trinativeinstall.sh 1.23.0
Create ~/.local/share tridactyl
