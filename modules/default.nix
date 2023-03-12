{ inputs, pkgs, config, ... }:

{
  imports = [
    ./i3
    # alacrity
    ./awesome
    ./fonts
    ./git
    # helix
    ./kitty
    ./nano
    # neovim
    ./packages
    ./python
    ./tmux
    ./vscode
  ];
}
