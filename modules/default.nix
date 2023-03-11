{ inputs, pkgs, config, ... }:

{
  imports = [
    # alacrity
    ./awesome
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
