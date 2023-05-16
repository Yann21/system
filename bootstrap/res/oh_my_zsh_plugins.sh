#!/usr/bin/env bash

pushd "$HOME/.oh-my-zsh/custom/plugins/" || exit

clone_if_not_exist() {
    [[ $# -lt 2 ]] && exit 0

    GIT_REPO=$1
    ALIAS=$2

    [[ ! -d $2 ]] && git clone "https://github.com/${GIT_REPO}" "$ALIAS"
}

CLONE_ME=(
    unixorn/fzf-zsh-plugin.git fzf-zsh-plugin
    MichaelAquilina/zsh-auto-notify.git auto-notify
    MichaelAquilina/zsh-you-should-use.git you-should-use
    hlissner/zsh-autopair.git autopair
    agkozak/zsh-z.git z
    zsh-users/zsh-completions.git zsh-completions
    gradle/gradle-completion gradle-completion
    supercrabtree/k k
    MichaelAquilina/zsh-autoswitch-virtualenv.git autoswitch_virtualenv
    Aloxaf/fzf-tab fzf-tab
    zdharma-continuum/fast-syntax-highlighting fast-syntax-highlighting
    jeffreytse/zsh-vi-mode zsh-vi-mode
)

for repo in "${CLONE_ME[@]}"; do
    # Split tuples
    set -- "$repo"
    clone_if_not_exist "$1" "$2"
done


# oh-my-zsh loads the auto-notify only if the file auto-nofiy/auto-notify.plugin.zsh exists
if [[ ! -d conda-completion ]]; then
    git clone https://github.com/esc/conda-zsh-completion.git conda-completion
    ln -s conda-zsh-completion.plugin.zsh conda-completion/conda-completion.plugin.zsh
fi
if [[ ! -d autoswitch-conda ]]; then
    git clone https://github.com/bckim92/zsh-autoswitch-conda.git autoswitch-conda
    ln -s autoswitch_conda.plugin.zsh autoswitch-conda/autoswitch-conda.plugin.zsh
fi
if [[ ! -d syntax-highlighting ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting syntax-highlighting
    ln -s zsh-syntax-highlighting.plugin.zsh syntax-highlighting/syntax-highlighting.plugin.zsh
fi
if [[ ! -d autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions autosuggestions
    ln -s zsh-autosuggestions.plugin.zsh autosuggestions/autosuggestions.plugin.zsh
fi
if [[ ! -d autoswitch_virtualenv ]]; then
    git clone https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git autoswitch-virtualenv
    ln -s autoswitch_virtualenv.plugin.zsh autoswitch-virtualenv/autoswitch-virtualenv.plugin.zsh
fi

popd || exit
