{ config, pkgs, ... }:

# a515-54g-53gp

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
  user="eee";
in
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Flake
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.utf8";
    LC_IDENTIFICATION = "pt_BR.utf8";
    LC_MEASUREMENT = "pt_BR.utf8";
    LC_MONETARY = "pt_BR.utf8";
    LC_NAME = "pt_BR.utf8";
    LC_NUMERIC = "pt_BR.utf8";
    LC_PAPER = "pt_BR.utf8";
    LC_TELEPHONE = "pt_BR.utf8";
    LC_TIME = "pt_BR.utf8";
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm.enable = true;
      autoLogin.user = user;
    };

    desktopManager.session = [
      {
        name = "xsession";
        start = ''
          ${pkgs.runtimeShell} $HOME/.xsession & waitPID=$!
         '';
      }
    ];
  };
  
  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ "networkmanager" "docker" "wheel" "libvirtd" ];
    shell = pkgs.bash;
    packages = with pkgs; [
        
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    virt-manager
    nvidia-offload
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # OpenSSH daemon.
  services.openssh.enable = true;

  # Docker
  virtualisation.docker.enable = true;
  
  # Libvirtd
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;
 
  # intel/nvidia (optimus) & opengl
  services.xserver.videoDrivers = [ "intel" "nvidia" ]; 
  hardware.opengl.enable = true;
  hardware.nvidia.prime = {
    offload.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:2:0:0";
  };

  system.stateVersion = "22.11"; # Did you read the comment?

  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME    = "\${HOME}/.local/bin";
    XDG_DATA_HOME   = "\${HOME}/.local/share";
    DOT_FILES = "\${HOME}/.dotfiles";
    NIXOS_CONFIG = "${DOT_FILES}/system/acer/configuration.nix";
  };
  # to nautilus work
  services.gvfs.enable = true;

}
