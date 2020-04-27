#!/usr/bin/env bash

git_account="ftlio"
dotfiles_repo="dotfiles"

shopt -s dotglob
for filepath in $HOME/.dotfiles/*; do
    filename=$(basename $filepath)
    case $filename in
        README.md|.gitattributes|setup.sh|.git|.gitignore|.|..)
            continue
            ;;
        *)
            echo $filepath
            echo $filename
            ln -s $filepath $HOME/$filename
            ;;
    esac
done
