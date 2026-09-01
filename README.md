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
- **Keybindings** — four tabs (Hyprland, Tmux, Herdr, Neovim) with live
  search. Hyprland rows are parsed from `omarchy menu keybindings
  --print` and your `bindings.lua` overrides are flagged inline.
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
git clone https://github.com/tjholmesphd-hash/omarchy-command-center.git
cd omarchy-command-center

# 1. install the only dependency
pip install --user textual          # or via your distro/venv

# 2. install the app
./install.sh                         # → copies to ~/.local/bin
```

Or skip the installer and just put the script on your `PATH` yourself —
it is completely self-contained:

```sh
cp omarchy-command-center ~/.local/bin/
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
| 4 | Keybindings | Hyprland / Tmux / Herdr / Neovim |
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