# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
#  boot.kernelPackages = pkgs.linuxPackages_6_5;

  networking.hostName = "filemon"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  systemd.services.NetworkManager-wait-online.enable = false;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = false; #Using Pipewire

  # Allow Unfree

  nixpkgs.config.allowUnfree = true;

  # Add custom ca-certs

  #  security.pki.certificates = [ "{pkgs.cacert}/etc/ssl/certs/Roche/*.crt" ];
    security.pki.certificates = [ "{pkgs.cacert}/home/cortescc/.config/nixos/Roche/*.crt" ];

  # xdg-desktop-portal works by exposing a series of D-Bus interfaces
  # known as portals under a well-known name
  # (org.freedesktop.portal.Desktop) and object path
  # (/org/freedesktop/portal/desktop).
  # The portal interfaces include APIs for file access, opening URIs,
  # printing and others.
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Enable Wayland and Sway

  programs.sway.enable = true;
  programs.waybar.enable = true;
  programs.dconf.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     tree
  #   ];
  # };

  # Create my user declaratively

   users.users.cortescc = {
    isNormalUser = true;
    home = "/home/cortescc";
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "kvm" "vboxusers" "docker" ];
};

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.cortescc = import ./home.nix;
  };

  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_DESKTOP= "sway";
    XCURSOR_SIZE = "16";
    MOZ_ENABLE_WAYLAND= "1";
    RTC_USE_PIPEWIRE= "true";
    XDG_SESSION_TYPE= "wayland";
    WLR_RENDERER= "vulkan";
    WLR_NO_HARDWARE_CURSORS= "1";
    XWAYLAND_NO_GLAMOR= "1";
    SDL_VIDEODRIVER= "wayland";
#    GDK_BACKEND= "wayland";
#    QT_QPA_PLATFORM= "wayland";
#    QT_WAYLAND_DISABLE_WINDOWDECORATION= "1";
#    QT_QPA_PLATFORMTHEME= "qt5ct";
    GBM_BACKEND= "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME= "nvidia";
    NIXOS_OZONE_WL = "1";

    # Not officially in the specification
    XDG_BIN_HOME    = "$HOME/.local/bin";
    PATH = [ 
      "${XDG_BIN_HOME}"
    ];
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #linuxKernel.packages.linux_5_15.nvidia_x11_beta
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    kitty
    firefox
    chromium
    git
    swaylock
    swayidle
    swaybg
    foot
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    bemenu # wayland clone of dmenu
    mako # notification system developed by swaywm maintainer
    wdisplays # tool to configure displays
    dracula-theme #GTK Theme
    gnome3.adwaita-icon-theme
    xdg-utils #for opening default programs when clicking links
    wofi #wayland app launcher
    waybar #replacement for swaybar
    gnome.cheese
    alacritty
    vulkan-validation-layers
    tmux
    foot
    pavucontrol
    pasystray
    patray
    synology-drive-client
    imv
    lxappearance
    unzip
    google-chrome
    google-chrome-beta
    slack
    gnome3.adwaita-icon-theme
    wayland
    cacert
    xdg-desktop-portal-wlr
    vlc
    obs-studio
    obs-studio-plugins.obs-pipewire-audio-capture
    wireplumber
    awscli2 # official `aws` CLI program
    ffmpeg
    gimp
    killall
    lm_sensors
    mplayer
    openssl
    pciutils # lspci
    v4l-utils
    zoom-us
    simplescreenrecorder
    gst_all_1.gstreamer.dev
    youtube-dl
    man-pages
    libcamera
    kubectl
    kubecolor
    vault
    terraform
    starship
    virt-manager
    xdg-user-dirs
    newsboat
    minikube
    kubernetes
    kubernetes-helm
    kubecm
    kubeval
    vagrant
    neofetch
    htop
    tree
    moc
    nfs-utils
    qutebrowser
    gnumake
    taskwarrior
  ];

  #FONT CONFIGURATION

  fonts.fonts = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    font-awesome
];


  powerManagement.enable = true;

  # When suspending, kill all sshfs instances, as otherwise it can make
  # either suspend or resume hang (hang on resume requires force reboot).
  powerManagement.powerDownCommands = ''
    ${pkgs.procps}/bin/pkill -9 sshfs
  '';

  # Enable Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    alsa.support32Bit= true;
  };

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.opengl.extraPackages = with pkgs; [
    # trying to fix WLR_RENDERER=vulkan sway
    vulkan-validation-layers
  ];

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Do not disable this unless your GPU is unsupported or if you have a good reason to.
    open = true;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable virtualization

  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.docker.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

