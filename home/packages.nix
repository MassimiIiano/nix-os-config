{pkgs, ...}: {
  nixpkgs.config.allowUnfree = false;
  home.packages = with pkgs; [
    # social
    discord               # chat client
    
    # dev tools
    gh                    # github cli
    vscode                # code editor 
    docker-compose        # docker

    # cybersicurity
    wireshark             # network analysis
    burpsuite             # web app pentesting
    ngrok                 # tunneling

    # gaming
    protonup             
    bastet                # tetris
    teams-for-linux       # microsoft teams

    # learning
    obsidian
  ];
}