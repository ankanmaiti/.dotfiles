# DOTFILES

## Install CLI Tools
1. [Starship](https://starship.rs/) : A cross-shell prompt
1. [Neovim](https://github.com/neovim/neovim) : Vim-fork best editor
1. [FZF](https://github.com/junegunn/fzf) : 🌸 A command-line fuzzy finder 
1. [Bat](https://github.com/sharkdp/bat) : A better cat with syntax highlighting
1. [Eza](https://github.com/eza-community/eza) : A modern replacement for ls.
1. [Zoxide](https://github.com/ajeetdsouza/zoxide) : A smarter cd command. Supports all major shells. 

## Symbolic Links

 
### .bashrc
```bash
rm -f ~/.bashrc
```
```bash
ln -s ~/dotfiles/bash/.bashrc ~/
```

### [tmux](https://github.com/tmux/tmux/wiki)
```bash
rm -f ~/.tmux.conf
```
```bash
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

### [kitty](https://sw.kovidgoyal.net/kitty/binary/)
```bash
rm -f ~/.config/kitty
```
```bash
ln -s ~/dotfiles/kitty ~/.config/
```

### [starship](https://starship.rs/)
```bash
rm -f ~/.config/starship.toml
```
```bash
ln -s ~/dotfiles/starship/starship.toml ~/.config/
```

### [neovim](https://github.com/neovim/neovim)
```bash
rm -f ~/.config/nvim
```
```bash
ln -s ~/dotfiles/nvim ~/.config/
```

