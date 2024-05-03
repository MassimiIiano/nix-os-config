#!/usr/bin/env bash

# Add all files to the staging area
git add .

# Commit the changes with the current date and time as the message
git commit -m "nixos switch: $2"

# Push the changes to the remote repository
git push

# Rebuld NixOS
sudo nixos-rebuild switch --flake ./#marvin --comment $1