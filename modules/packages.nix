{ config, lib, pkgs, ... }:

{
  # Install firefox
  programs.firefox.enable = true;

  # Install fish shell
  programs.fish.enable = true;
  documentation.man.generateCaches = false;

  # Install thunderbird
  programs.thunderbird.enable = true;

  # Install hyprland
  # programs.hyprland = {
	#   enable = true;
	#   xwayland.enable = true;
  # };

  # Install sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # Set wayland as default
  environment.sessionVariables = {
    # NIXOS_OZONE_WL = "1";
  };

  hardware = {
	  graphics.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	# Programming languages
    nodejs_22
    rustc
    cargo
    rust-analyzer
    jdk
    python39
    haskell.compiler.native-bignum.ghcHEAD
    cabal-install
    dotnetCorePackages.dotnet_9.sdk
    dotnetCorePackages.dotnet_9.runtime
    nixfmt-rfc-style
    shellcheck
    libgcc
    gcc14

	# Editors
    vim
    emacs
    # pkgs.emacsPackages.compat

	# tools
    gh
    fd
    zip
    unzip
    wget
    git
    htop
    ripgrep
    bat
    vagrant
    gnumake
    tree
    mendeley
    linux-manual
    man-pages
    tree-sitter

  # Sway tools
    light
    brightnessctl
    rofi-wayland
    pamixer
    sway-contrib.grimshot
    wl-mirror
    swaybg
    swayidle
    swaylock
    swayimg
    waybar
    autotiling

  # Wallpapers
    nixos-artwork.wallpapers.simple-dark-gray

	# Programs
	  google-chrome
    caprine
    ghostty
    cantarell-fonts
    font-awesome
    discord
    spotify

  # Language servers
    python312Packages.python-lsp-server
    fsautocomplete
    millet
    asm-lsp
  ];

  # List services that you want to enable:
  services.emacs = {
	  enable = true;
	  package = pkgs.emacs;
  };
}
