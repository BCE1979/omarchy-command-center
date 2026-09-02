# Omarchy Command Center

A single-file terminal UI for managing your Omarchy dotfiles — themes, bar
layout, keybindings, terminals, plugins, lifecycle hooks, and defaults —
all from one screen.

Runs entirely on your machine; nothing is sent anywhere. Pure public
domain (CC0): use it, fork it, ship it, sell it — no attribution
required.

## Features

- **Dashboard** — at-a-glance view of your Omarchy installation: version,
  active theme, bar position/transparency, idle timers, defaults,
  installed/enabled plugins, hooks, and a commands health check.
- **Theme-aware UI** — the interface palette is built from your active
  Omarchy theme's `colors.toml`, so it follows light and dark themes
  automatically; no manual theming needed.
- **Themes** — browse user and built-in themes, preview each one's core
  colors and ANSI palette live from its `colors.toml`, apply with a
  single key (`omarchy theme set`).
- **Bar** — rearrange widgets between the left/center/right sections,
  add custom widget ids, change position and transparency, set the clock
  anchor and idle/screensaver timers. Saved to `shell.json` with a
  timestamped backup before each write.
- **Input** — mouse sensitivity/accel, keyboard layout and repeat,
  touchpad scroll. Writes `~/.config/hypr/input.lua` and runs
  `hyprctl reload`.
- **Workspaces** — rename all 10 bar slots (including empty ones).
  Names persist on a cloned `$USER.workspaces` widget; save restarts
  the Omarchy shell so the bar actually recompiles (Quickshell does
  not clear its QML cache on plugin reload).
- **Keybindings** — four tabs (Hyprland, Tmux, Herdr, Neovim) with live
  search. Advanced editing covers Tmux/Herdr/Neovim against live Omarchy
  formats. Hyprland overrides go to `~/.config/hypr/bindings.lua`.
- **Terminals** — detect installed terminal emulators, inspect each
  config (with its theme `include`/`import` line), set the default.
- **Plugins** — list installed plugins with their manifest metadata and
  enable/disable state, toggle registration in `shell.json`, open a
  plugin's folder.
- **Hooks** — list lifecycle hooks (active ● / inactive ○), preview the
  script contents, toggle by renaming the `.sample` marker.
- **Defaults** — edit the agent/browser/editor/terminal defaults,
  validated against known values, written through `omarchy default`.

## Requirements

- Linux with **Omarchy** installed (`omarchy` on `PATH`)
- Python 3.10+
- [Textual](https://github.com/Textualize/textual) `>= 8.0`

## Installation

```sh
# clone
git clone https://github.com/BCE1979/omarchy-command-center.git
cd omarchy-command-center

# 1. install the only dependency
pip install --user textual          # or via your distro/venv

# 2. install the app (v2 is the default)
./install.sh                         # same as ./install.sh v2
./install.sh v1                      # original 1.x script
```

Or skip the installer and copy a script onto your `PATH`:

```sh
cp omarchy-command-center-v2 ~/.local/bin/omarchy-command-center
chmod +x ~/.local/bin/omarchy-command-center
```

## Usage

```sh
omarchy-command-center
```

### Navigation

| Key | Action |
|-----|--------|
| `1`–`8` | Jump to a view (no F-keys needed) |
| `↑`/`↓` | Move in a list |
| `Enter` | Select / apply |
| `r` | Refresh the current view |
| `q` | Quit |

### Views

| # | View | Manages |
|---|------|---------|
| 1 | Dashboard | status overview, plugin/hook counts |
| 2 | Themes | browse + apply themes |
| 3 | Bar | layout, position, idle timers |
| 4 | Keybindings | Hyprland / Tmux / Herdr / Neovim; Enter or Edit… on a Hyprland row |
| 5 | Terminals | detection, configs, default |
| 6 | Plugins | enable/disable, register |
| 7 | Hooks | lifecycle hooks on/off |
| 8 | Defaults | agent / browser / editor / terminal |

## Safety

Every write goes through the same mechanisms you'd use by hand
(`omarchy theme set`, `omarchy default`, `omarchy bar …`), and config
files are backed up to a timestamped `*.bak.*` before each edit. Nothing
runs until you press a button.

## Uninstall

```sh
rm ~/.local/bin/omarchy-command-center
```

## License

[CC0 1.0 Universal](LICENSE) — public domain. Do whatever you like.