{pkgs, lib, ...}: {
  imports = [  ];

  home.packages = with pkgs; [
    dconf
  ];

  # Use home.activation to apply dconf settings
  home.activation.dconf = lib.hm.dag.entryAfter ["writeBoundary"] ''
    #!/bin/sh
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
  '';
}