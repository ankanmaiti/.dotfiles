
## Install CLI Tools
1. [Starship](https://starship.rs/) : A cross-shell prompt.
1. [Neovim](https://github.com/neovim/neovim) : Vim-fork best editor.
1. [FZF](https://github.com/junegunn/fzf) : 🌸 A command-line fuzzy finder.
1. [Bat](https://github.com/sharkdp/bat) : A better cat with syntax highlighting.
1. [Eza](https://github.com/eza-community/eza) : A modern replacement for ls.
1. [Zoxide](https://github.com/ajeetdsouza/zoxide) : A smarter cd command.
1. [Tmux](https://github.com/tmux/tmux) : Terminal Multiplexer.
1. [TPM](https://github.com/tmux-plugins/tpm) : Tmux Plugin Manager.
1. [Gitmux](https://github.com/arl/gitmux) : 💻 Git in your tmux status bar.
1. [Lazygit](https://github.com/jesseduffield/lazygit) : simple terminal UI for git commands.


## Symbolic Links

### delete links
```bash
rm -f ~/.bashrc
rm -f ~/.tmux.conf
rm -f ~/.config/kitty
rm -f ~/.config/starship.toml
rm -f ~/.config/nvim
```
### add links
```bash
ln -s ~/dotfiles/bash/.bashrc ~/
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/kitty ~/.config/
ln -s ~/dotfiles/starship/starship.toml ~/.config/
ln -s ~/dotfiles/nvim ~/.config/
```
