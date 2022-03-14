#!/usr/bin/env bash

pushd "$HOME/.oh-my-zsh/custom/plugins/" || exit

git clone https://github.com/unixorn/fzf-zsh-plugin.git fzf
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git auto-notify
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git you-should-use
git clone https://github.com/hlissner/zsh-autopair.git autopair
git clone https://github.com/agkozak/zsh-z.git z
git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/gradle/gradle-completion
git clone https://github.com/supercrabtree/k

# Given ~/.oh-my-zsh/custom/plugins/auto-notify
# oh-my-zsh loads the plugin only if the file [...]/auto-nofiy/auto-notify.plugin.zsh exists
git clone https://github.com/esc/conda-zsh-completion.git conda-completion
ln -s conda-zsh-completion.plugin.zsh conda-completion/conda-completion.plugin.zsh
git clone https://github.com/bckim92/zsh-autoswitch-conda.git autoswitch-conda
ln -s autoswitch_conda.plugin.zsh autoswitch-conda/autoswitch-conda.plugin.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting syntax-highlighting
ln -s zsh-syntax-highlighting.plugin.zsh syntax-highlighting/syntax-highlighting.plugin.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions autosuggestions
ln -s zsh-autosuggestions.plugin.zsh autosuggestions/autosuggestions.plugin.zsh
git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git autoswitch-virtualenv
ln -s autoswitch_virtualenv.plugin.zsh autoswitch-virtualenv/autoswitch-virtualenv.plugin.zsh

popd || exit
