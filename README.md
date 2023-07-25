# System

## Prerequisites
```{bash}
sudo apt install zsh unzip make
```

`sudo apt install rcm yarnpkg cmake golang npm curl inotify-tools`

## Start
```
git clone https://github.com/Yann21/system.git
./install.sh
```

## Finishing touches
`sudo apt install fzf conda fasd bat python3-venv libnotify-bin`


## Problems
- home/users/yahoffmann/.vim/plugged/YouCompleteMe/install.py: No such file or directory
- no sudo
- Eager macro-expansion failure: (user-error "Detected Emacs 26.1, but Doom requires 27.1 or newer (28.1 is

- command -v exa: shows alias even if executable doesn't h
- UbuntuMono.zip{,.1} left in the directory
- Ubuntu relaunches every time
- Creating
- Doesn't work if $HOME/.local/bin doesn't exist
- Create user not root
- Add ~/.local/bin to PATH

## GUI Problems
- Add native messenger to install script
curl -fsSl https://raw.githubusercontent.com/tridactyl/native_messenger/master/installers/install.sh -o /tmp/trinativeinstall.sh && sh /tmp/trinativeinstall.sh 1.23.0
Create ~/.local/share tridactyl
