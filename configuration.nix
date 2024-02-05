{ pkgs, ... }: {
  nix.package = pkgs.nixVersions.unstable;
  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    keep-outputs = true
    keep-derivations = true
  '';
  services.nix-daemon.enable = true;
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;
  system.defaults.dock.autohide = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder._FXShowPosixPathInTitle = true;

  imports = [
    ./pam_reattach.nix
  ];
  security.pam.enableSudoTouchIdAuthWithReattach = true;
  
  fonts.fontDir.enable = true;
  fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "Meslo" ]; }) ];

  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];
  environment.loginShell = pkgs.zsh;

  users.users.matt.home = "/Users/matt";

  system.stateVersion = 4;
}
