# Update system
alias sys='source ~/.bashrc && echo "bashrc sourced!"'
alias edit='code ~/.arch'

# List files
alias ll='ls -la'
alias la='ls -A'

# List installed packages
alias lp='pacman -Q'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Remove directory
rx() {
   rm -rf $1
}

# Install package and its dependencies
i() {
   sudo yay -S $1
}

# Remove package
r() {
   sudo yay -R $1
}

# Create directory and cd into it
mkcd() {
   mkdir -p $1
   cd $1
}