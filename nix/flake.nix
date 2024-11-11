{
  description = "Arstzy Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, config, ... }: {
      # Allow unfree packages (needed for some software)
      nixpkgs.config.allowUnfree = true;

      # List of packages to be installed in the system profile
      environment.systemPackages = [
        pkgs.neovim
        pkgs.yabai
        pkgs.mkalias
        pkgs.htop
        pkgs.vscode
        pkgs.git
        pkgs.nodejs
        pkgs.npm
        pkgs.zsh
        pkgs.oh-my-zsh
        pkgs.nvm
        pkgs.startship
        pkgs.rustc
        pkgs.cargo
        pkgs.iterm2
        pkgs.tree
      ];

      services.yabai.enable = true;

      # Enable Nix daemon service and set up environment
      services.nix-daemon.enable = true;

      # Enable experimental features for using flakes
      nix.settings.experimental-features = "nix-command flakes";

      # Enable Zsh as the default shell
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Set system state version for compatibility
      system.stateVersion = 5;

      # Post-build hook to reload shell environment
      system.activationScripts = {
        reloadShell = ''
          # Reload shell environment to make new packages available immediately
          if [ -n "$ZSH_VERSION" ]; then
            source ~/.zshrc
          elif [ -n "$BASH_VERSION" ]; then
            source ~/.bashrc
          fi
        '';
  
        startYabaiAtBoot = ''
        # start yabai 
        if [ ! -f /Library/LaunchAgents/com.yabai.yabai.plist ]; then
          sudo cp ${pkgs.yabai}/share/yabai/com.yabai.yabai.plist /Library/LaunchAgents/
        fi
          sudo launchctl load -w /Library/LaunchAgents/com.yabai.yabai.plist || true
        '';
      };

      # Specify the platform the configuration is for
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#arstzy
    darwinConfigurations."arstzy" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set for convenience
    darwinPackages = self.darwinConfigurations."arstzy".pkgs;
  };
}

