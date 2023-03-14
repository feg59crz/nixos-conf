# shell.nix
{ ktheme ? "Aquarium_Dark"}:
with import <nixpkgs> {};

mkShell {

  buildInputs = [
    
  ];

  shellHook = ''
    dir="$DOT_FILES/modules/kitty/kitty/themes/" # Replace this with the path to your directory
files=($(ls $dir)) # Get a list of all files in the directory

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
    # Copy the theme file from the dotfiles path to the current-theme file
    cp -rf $DOT_FILES/modules/kitty/kitty/themes/''${file_name} $DOT_FILES/modules/kitty/kitty/current-theme.conf
    # Copy the current-theme file to the XDG_CONFIG_HOME path
    cp -rf $DOT_FILES/modules/kitty/kitty/current-theme.conf $XDG_CONFIG_HOME/kitty/current-theme.conf
    exit
  '';
}

