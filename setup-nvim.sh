#!/bin/bash

# Update and install dependencies
echo "Installing dependencies..."
sudo apt update && sudo apt install -y git curl neovim

# Clone Neovim config repo
echo "Cloning Neovim configuration..."
git clone https://github.com/walkers-mv/nvim-config.git ~/.config/nvim

# Install plugin manager (packer.nvim)
echo "Setting up packer.nvim..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install Neovim plugins
echo "Installing plugins..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo "Neovim setup is complete!"

