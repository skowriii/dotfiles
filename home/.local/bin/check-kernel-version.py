#!/usr/bin/env nix-shell
#!nix-shell /personal/dotfiles/shell.nix -i python3

import subprocess as s
import re
import sys
import requests

# Determine kernel package we're using
kernelPackages_regex = re.compile(r"kernelPackages")

kernelPackage = ""
kernel_key = ""
path_info_package = "linux_"
with open("/personal/nixos/config/boot.nix", 'r') as f:
    lines = f.readlines()
    for line in lines:
        if kernelPackages_regex.search(line):
            kernelPackage = line.split()[2].strip("pkgs.").strip(';')
            kernel_key = f"nixpkgs.{kernelPackage}.kernel.x86_64-linux"

            path_info_package_list = kernelPackage.split('_')[1:]
            for i in enumerate(path_info_package_list):
                if i[0] == len(path_info_package_list) - 1:
                    path_info_package += i[1]
                else:
                    path_info_package += f"{i[1]}_"

            break

    f.close()

# Get nixpkgs url
nixpkgs_url_regex = re.compile(r"nixpkgs\.url")

nixpkgs_url = ""
with open("/personal/nixos/flake.nix", 'r') as f:
    lines = f.readlines()
    for line in lines:
        if nixpkgs_url_regex.search(line):
            nixpkgs_url = line.split()[2].strip('"').strip("\";")

            break

    f.close()

# Get latest version
version_regex = re.compile(r"[0-9]*\.[0-9]*\.[0-9]*")

command = ["nix", "path-info", "--json", "--json-format", '1', f"{nixpkgs_url}#{path_info_package}"]
output = s.run(command, capture_output=True).stdout.decode("utf-8")
latest_version = version_regex.search(output)[0]

# Get running installed version
running_installed_version = s.run(["uname", "-r"], capture_output=True).stdout.decode("utf-8")
running_installed_version = version_regex.search(running_installed_version)[0]

# Get latest installed version
latest_installed_version = s.run(["nh", "os", "info", "--fields", "kernel"], capture_output=True).stdout.decode("utf-8")
latest_installed_version = latest_installed_version.split('\n')[2]
latest_installed_version = version_regex.search(latest_installed_version)[0]

# Check if update is required
if running_installed_version != latest_version or latest_installed_version != latest_version:
    # Check if kernel is in cache
    narhash_regex = re.compile(r"[a-z0-9]{32}")

    narhash = narhash_regex.search(output)[0]

    response = requests.get(f"https://cache.nixos.org/{narhash}.narinfo")
    if response.status_code == 200:
        if sys.stdin and sys.stdin.isatty():
            print("Kernel is outdated!")
            print(f"Installed: \033[1;31m{running_installed_version}\033[0;0m")
            print(f"Latest: \033[1;32m{latest_version}\033[0;0m")
        else:
            s.run(["nix",
                   "run",
                   "nixpkgs#libnotify",
                   "--",
                   "Kernel is outdated!",
                   f"Installed: {running_installed_version}\nLatest: {latest_version}"
                 ])
