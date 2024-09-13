# Update system
alias sys='
   sudo pacman -Syu --noconfirm

   source ~/.bashrc
   echo -e "\033[0;32mbashrc sourced! \033[0m"
'
alias edit='code ~/.arch'

# List files
alias ll='ls -la'
alias la='ls -A'

# List installed packages
alias lp='pacman -Q'

# Install package and its dependencies
i() {
   for package in "$@"; do
      # Try to install package with pacman first
      if sudo pacman -S $package --noconfirm; then
         echo -e "\033[0;32m$package installed with pacman.\033[0m"
      else
         # If pacman fails, try to install with yay
         clearCache;
         yay -S $package --noconfirm
         echo -e "\033[0;32m$package installed with yay.\033[0m"
      fi

      # Add package to PACKAGES file if not already present
      if ! grep -q "$package" ~/.arch/PACKAGES; then
         echo "$package" >> ~/.arch/PACKAGES
      fi
   done
}

# Remove package
r() {
   for package in "$@"; do
      yay -R $package --noconfirm

      # Remove package from PACKAGES file if present
      sed -i "/$package/d" ~/.arch/PACKAGES

      echo -e "\033[0;31m$package removed.\033[0m"
   done
}

# Remove directory
rx() {
   rm -rf $1
}

# Create directory and cd into it
mkcd() {
   mkdir -p $1
   cd $1
}

# Utils
clearCache() {
   builds=("04" "37" "68")
   for build in "${builds[@]}"; do
      sudo rm -rf /usr/lib/debug/.build-id/$build
   done
}