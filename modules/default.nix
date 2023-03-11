{ inputs, pkgs, config, ... }:

{
  imports = [
    ./packages

    ./cinnamon
    ./awesome
    ./git
    ./kitty
    ./tmux
    ./nano
    ./vscode
    ./python

  ];
}
