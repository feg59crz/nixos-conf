# shell.nix
# Made to change kitty themes 
{ ktheme ? "Aquarium_Dark"}:
with import <nixpkgs> {};
let
  themes_path = "$DOT_FILES/modules/kitty/kitty/themes/";
in
mkShell {

  buildInputs = [
    
  ];

  shellHook = ''
    # Dir with themes
    dir="${themes_path}"
    # list themes
    files=($(ls $dir))
    
    # Choose a new theme
    echo "Choose a file:"

    for i in ''${!files[@]}; do
      echo "$i) ''${files[$i]}"
    done

    read -p "Enter file number: " file_number

    if ! [[ $file_number =~ ^[0-9]+$ ]] || [[ $file_number -lt 0 ]] || [[ $file_number -ge ''${#files[@]} ]]; then
      echo "Invalid input"
      exit 1
    fi
    
    file_name=''${files[$file_number]}

    cp -rf $DOT_FILES/modules/kitty/kitty/themes/''${file_name} $XDG_CONFIG_HOME/kitty/current-theme.conf
    exit
  '';
}

