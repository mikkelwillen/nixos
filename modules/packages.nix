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
    cabal-install
    cargo
    # dotnetCorePackages.dotnet_9.runtime
    dotnet-sdk_9
    fsharp
    gcc14
    haskell.compiler.ghc983
    jdk
    libgcc
    nixfmt-rfc-style
    nodejs_22
    rust-analyzer
    rustc
    shellcheck
    python312
    python312Packages.pip

  # Editors
    eask-cli
    emacs
    emacs-lsp-booster
    stack
    vim
    pkgs.emacsPackages.pdf-tools
    # pkgs.emacsPackages.compat

  # tools
    bat
    fd
    gh
    git
    gnumake
    htop
    linux-manual
    man-pages
    mendeley
    ripgrep
    tree
    tree-sitter
    unzip
    vagrant
    wget
    zip

  # Sway tools
    autotiling
    brightnessctl
    light
    pamixer
    rofi-wayland
    sway-contrib.grimshot
    swaybg
    swayidle
    swayimg
    swaylock
    waybar
    wl-mirror

  # Wallpapers
    nixos-artwork.wallpapers.simple-dark-gray

	# Programs
    cantarell-fonts
    caprine
    cutter
    discord
    font-awesome
    ghostty
    google-chrome
    spotify
    zoom-us

  # Language servers
    fsautocomplete
    asm-lsp
    millet
    python312Packages.python-lsp-server
    (haskell-language-server.override { supportedGhcVersions = [ "94" "983" ]; })

  # Formatters
    rustfmt
  ];

  # List services that you want to enable:
  # Enables the emacs daemon
  services.emacs = {
	  enable = true;
	  package = pkgs.emacs;
  };
}
