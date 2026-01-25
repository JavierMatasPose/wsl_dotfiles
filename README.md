# My Personal WSL Dotfiles
Configuration files for my development environment in WSL (Windows Subsystem for Linux).

### 1. System Update & Base Dependencies
Ensure basic build tools and git are installed (required for Homebrew and Nvim dependencies).

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential git curl wget unzip -y
```
### 2. Install ZSH
Install the shell and set it as default.

```bash
sudo apt install zsh -y
chsh -s $(which zsh)
# Note: You may need to restart your terminal for the change to take effect.
```
### 3. Install Homebrew
Package manager for Linux/WSL.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Add Homebrew to your PATH (Run these commands after the installation finishes):
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```
### 4. Install Core Tools (via Homebrew)
Install Neovim, Node.js, Tmux, and other essentials.

```bash
brew install neovim tmux node ripgrep fzf bat bun
```
### 5. Setup UV and Python
Install uv, an extremely fast Python package manager and resolver.

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
# UV will handle Python versions automatically
```
### 6. Setup Neovim (NvChad)
Make sure you have a Nerd Font installed in your Windows Terminal before this step.
Check https://github.com/nvim-lua/kickstart.nvim instead of NvChad

```bash
# Backup existing config if present
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
# Clone NvChad starter repo
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
# Open nvim; NvChad will install plugins automatically on first launch
nvim
```
### 7. Setup ZSH (Oh My Zsh + Plugins)
Install the framework and essential plugins (autosuggestions and syntax highlighting).

```bash
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
### 8. Setup Tmux
Install the Tmux Plugin Manager.

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# To install plugins later, open tmux and press: prefix + I (Capital I)
```
### 9. (Optional) UI & Terminal
Powerlevel10k Prompt:

```bash
git clone --depth=1 [https://github.com/romkatv/powerlevel10k.git](https://github.com/romkatv/powerlevel10k.git) ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# 1. Set ZSH_THEME="powerlevel10k/powerlevel10k" in your .zshrc
# 2. Restart Zsh and run: p10k configure
```
# Applying the Dotfiles

```bash
git clone [https://github.com/JavierMatasPose/wsl_dotfiles.git](https://github.com/JavierMatasPose/wsl_dotfiles.git) ~/dotfiles:
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
# Removing default nvim config
rm -rf ~/.config/nvim
ln -sf ~/dotfiles/nvim.bak ~/.config/nvim

