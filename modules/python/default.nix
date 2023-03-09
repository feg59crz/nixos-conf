{ pkgs, lib, config, ... }:

with lib;
let 
  cfg = config.modules.python;

  my-python-packages = with pkgs; python-packages: with python-packages; [
    requests
    flask
    numpy
    scipy
    matplotlib
    notebook
    cryptography
    pip
    openai
    # other python packages you want
  ]; 
  python-with-my-packages = with pkgs; python3.withPackages my-python-packages;


in {
    options.modules.python = { enable = mkEnableOption "python"; };
    config = mkIf cfg.enable {
      home.packages = with pkgs; [
        python-with-my-packages        
      ]; 
   };
}
