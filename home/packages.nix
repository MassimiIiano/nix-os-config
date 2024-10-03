{pkgs, ...}: {
  nixpkgs.config.allowUnfree = false;
  home.packages = with pkgs; [
    # social
    discord               # chat client
    
    # cybersicurity
    wireshark             # network analysis
    burpsuite             # web app pentesting
    ngrok                 # tunneling

    # gaming
    protonup             
    teams-for-linux       # microsoft teams

    # learning
    obsidian
  ];
}