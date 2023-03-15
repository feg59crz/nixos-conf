{ inputs, pkgs, config, ... }:

{
  imports = [
    ./i3
    # alacrity
    ./awesome
    ./bash
    ./fonts
    ./git
    # helix
    ./kitty
    ./nano
    ./neovim
    ./packages
    ./python
    ./steam
    ./tmux
    ./vscode
  ];
}
