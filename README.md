# Dotfiles

Personal configuration files for various tools and applications.

## Usage

The installation script supports several commands:

### Install dotfiles

```bash
./install.sh
```

This will:

- Create symbolic links from your home directory to the dotfiles in this repository
- Backup any existing files to `~/.dotfiles_backup/` with timestamps
- Skip files that are already correctly linked

### Check status

```bash
./install.sh status
```

Shows the current status of all dotfiles - whether they're linked, missing, or exist as regular files.

### Uninstall

```bash
./install.sh uninstall
```

Removes all symbolic links created by the install script.

### Help

```bash
./install.sh help
```

Shows usage information.
