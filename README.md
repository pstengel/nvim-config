# nvim-config

A Site Reliability Engineer's [NeoVim](https://neovim.io) config.

## Usage

A `Makefile` is included to aid with setup. The following will clone the
repository to the current directory, make a backup of your existing NeoVim
configuration, **remove your existing NeoVim configuration**, and install the
symlinks necessary for the repository to begin managing the NeoVim
configuration:

    git clone https://github.com/pstengel/nvim-config.git && cd nvim-config
    make force-uninstall
    make install

If you want to revert, the backup will be located in the `.backups` directory
in the root of the repository.

## Makefile Targets

### backup

    make backup

Creates a backup of the existing NeoVim configuration in the `.backups`
directory at the root of the repository.

This target may emit an error if a NeoVim configuration does not already exist.
These can safely be ignored.

### force-uninstall

    make force-uninstall

**Forcefully remove any existing NeoVim configuration**. `make backup` is an
automatic prerequisite of this command.

### install

    make install

Create symlinks to the NeoVim configuration managed by this repository.

### uninstall

    make uninstall

Remove symlinks for the NeoVim configuration managed by this repository only if
the existing configuration is linked to using symlinks.

## Random Notes Related to Code/Editing

### Preferred Comment Markup Keywords

| Keyword  | Description                                                                        |
| -------- | ---------------------------------------------------------------------------------- |
| BUG      | If the user inputs "Easter" we always output "Egg", even if they wanted a "Bunny". |
| FIXME    | We sometimes get an undefined index in this array.                                 |
| HACK     | I am doing something here that is horrible, but it works for now...                |
| NOTE     | This is here because sometimes an intermittent issue appears.                      |
| OPTIMIZE | This could be reworked to not do a O(N2) lookup.                                   |
| TODO     | Add a check here to ensure these are always strings.                               |
| XXX      | Let's do this better next time? It's bad.                                          |
