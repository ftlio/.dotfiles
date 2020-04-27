# Bash RC File

for file in $HOME/.bashrc.d/*.bashrc; do
    source "$file"
done
