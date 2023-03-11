{ inputs, pkgs, config, ... }:

{
  imports = [
    ./packages
    ./awesome
    ./git
    ./kitty
    ./tmux
    ./nano
    ./vscode
    ./python

  ];
}
