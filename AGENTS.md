# AGENTS.md — dotfiles

NixOS + home-manager flake for user `noodl3`. Hosts: `multivac` (daily
driver), `minivac`. Timezone America/New_York; fish shell; i3 WM; Doom
Emacs (evil) as main editor.

## ⚠ The one rule that bites

**Flakes only copy git-tracked files into the store.** A file that is
written but never `git add`-ed (staging is enough — committing is not) is
*silently invisible* to the build. This once made `(load! "lisp/hw")` fail
at every Doom startup, aborting half of `config.el` — the symptom was
missing keybindings, not an obvious error. **Whenever you add a file to
this repo, stage it before rebuilding.**

## Build & apply

```bash
sudo nixos-rebuild switch --flake ~/dotfiles#$(hostname)
```

- Everything goes through this one command: NixOS config, home-manager,
  Doom config, the dotfiles in `config/` (symlinked into the store),
  scripts in `scripts/`.
- After Doom changes: restart Emacs. After `doom/packages.el` changes, the
  Doom profile is rebuilt by Nix — no manual `doom sync`.
- `nixd` and `nixfmt` are on PATH for checking/formatting `.nix` files.

## Layout

- `flake.nix` — inputs (nixpkgs + home-manager 26.05, nvf,
  nix-doom-emacs-unstraightened, pi) and host definitions.
- `configuration.nix` — shared NixOS config; imports `hardware/${host}.nix`
  and `modules/nvf.nix`.
- `hardware/` — per-host hardware config. `hosts/` — empty placeholders.
- `modules/` — NixOS modules; `nvf.nix` = Neovim via NotAShelf/nvf
  (+ `keymaps.nix`, `plugins.nix`, `snippets.nix`, `lua/`).
- `home.nix` + `home/` — home-manager: `packages.nix` (user packages),
  `files.nix` (the symlinks below), `services.nix`, `programs/` (fish,
  tmux, zathura, git, doom-emacs, …).
- `config/` — plain dotfiles (i3, i3status, kitty, picom, vim, firefox),
  symlinked to `~/.config/…` by `home/files.nix`.
- `scripts/` — shell scripts, symlinked as a dir to `~/.local/bin`
  (so `scripts/hw` is `~/.local/bin/hw`).
- `doom/` — Doom Emacs config, see below.

## Doom Emacs

- Managed by `nix-doom-emacs-unstraightened`
  (`home/programs/doom-emacs.nix`, `doomDir = doom/`). **There is no
  `~/.config/doom`** — the config is baked into the Nix store at build
  time. Debugging tip: the live doomdir is whatever the current
  `doom-profile` in `/nix/store` symlinks to; check it, not the repo, to
  see what Emacs actually runs.
- Files: `init.el` (`doom!` module selection), `config.el` (all custom
  config), `packages.el` (extra packages: haki-theme, typst-ts-mode).
- pdf-tools via `:tools pdf`; eglot for LSP; no typst LSP (by choice).
- Cheap sanity check for `config.el` after edits (catches paren bugs):

```bash
emacs -Q --batch --eval '(with-temp-buffer (insert-file-contents "doom/config.el") (goto-char (point-min)) (condition-case e (while t (read (current-buffer))) (end-of-file (message "READ OK")) (error (message "READ ERROR %s" e))))'
```

## Typst / homework workflow

- `typst` + `typstyle` binaries come from `home/packages.nix`; typstyle
  formats on save via apheleia (`:editor (format +onsave)`).
- Live preview (defined in `doom/config.el`):
  - `SPC o h` → `+typst/preview` — runs `typst watch` in the file's own
    directory (compilation buffer, bottom popup, `g` restarts) and opens
    the PDF in a right split; `global-auto-revert-mode` refreshes it on
    every rebuild. Works from any buffer (prompts if current file isn't
    `.typ`).
  - In typst buffers: `, c` → `+typst/watch`, `, r` → `+typst/preview`.
- `~/school/<course>/{homework,notes,projects}`; courses: EC427-SWE,
  EC440-OS, EC521-Cyber, EK301-Statics, QST480-Business. Homework files
  are `%02dhw.typ` (e.g. `03hw.typ`).
- `~/.local/bin/hw` (bash) scaffolds new homework/notes, but expects
  `~/.local/bin/schoolWorkTemplate.typ`, which **does not exist yet**
  (as of 2026-11) — supply a template before relying on that script.

## Pi (this agent)

- Sessions persist on disk under `~/.pi/agent/sessions/`. Resume with
  `pi --continue` (latest for this directory) or `pi --resume` (picker)
  instead of starting a fresh session.
- This file is auto-loaded at the start of every session in this repo.
  Keep it current: when you learn something non-obvious (environment
  quirks, "we chose X because Y", recurring commands), add it here.
