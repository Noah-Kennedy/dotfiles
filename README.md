# Dotfiles
A repository for my configuration setup.

# Overview
This repository supports the configuration for two machines which I use.

Both run a customized image I created based on Manjaro,
however this configuration should work on any machine which has the
dependencies needed.

I use gdm for both machines.

`i3-gaps` is my primary window manager, however, I do have Gnome installed as a
backup just in case `i3` has an issue.

A Makefile is used to setup the system.

# Overview of Machines

I use two machines for my daily work. Each of them has a codename.

My laptop is codenamed Shiv, and my desktop is codenamed Longbow.

## Shiv
Shiv has a 1920x1080 display.

## Longbow
Longbow is the desktop that I use.
It has three monitors, a central 2560x1080 that is the primary display, and two
1920x1080 displays on either side of it. The leftmost display is vertical.


# Installation

## Required Packages
TODO

## Shiv

```sh
make shiv
```

## Longbow

```sh
make longbow
```

## Neovim

Either script will place the Neovim config into `~/.config/nvim/init.vim`.
In order to download the plugins, run `:PlugInstall` from within Neovim.
