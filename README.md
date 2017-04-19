# nvim-config

A system architect's NeoVim config.

## Usage

A `Makefile` is included to aid with setup. To use it,
[Homebrew](https://brew.sh) must be installed. TL;DR:

    git clone https://github.com/pstengel/nvim-config.git && cd nvim-config
    git submodule update --init
    make clean
    make install

**IF YOU WANT TO KEEP YOUR EXISTING CONFIG, BACK IT UP BEFORE RUNNING THIS!**

### make clean

The `clean` target will remove any existing config and the Inconsolata fonts.
In addition, `git clean` will be run on the cloned repository to remove any
downloaded plugins, stale swap files, etc.

### make install

This does the following to install the config:

1. Download the latest Inconsolata font from Google Fonts to `~/Library/Fonts`
2. Symlink `~/.config/nvim -> config/` and `~/.local/share/nvim -> local/`
3. Install NeoVim through Homebrew
4. Run `PlugInstall` to install the configured vim plugins

### make update

Use this to update the configured vim plugins and Inconsolata font.
