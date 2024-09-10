# Update system
alias sys='source ~/.bashrc && echo -e "\033[0;32mbashrc sourced! \033[0m"'
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
   clearChache;

   # Install package
   yay -S $1 --noconfirm

   # Add package to PACKAGES file if not already present
   if ! grep -q "$1" ~/.arch/PACKAGES; then
      echo "$1" >> ~/.arch/PACKAGES
   fi

   echo -e "\033[0;32m$1 installed.\033[0m"
}

# Remove package
r() {
   yay -R $1 --noconfirm

   # Remove package from PACKAGES file if present
   sed -i "/$1/d" ~/.arch/PACKAGES

   echo -e "\033[0;31m$1 removed.\033[0m"
}

# Create directory and cd into it
mkcd() {
   mkdir -p $1
   cd $1
}

# Utils
clearChache() {
   builds=("04" "37" "68")
   for build in "${builds[@]}"; do
      sudo rm -rf /usr/lib/debug/.build-id/$build
   done
}