# forkunsafe Homebrew tap

Homebrew formulae maintained by forkunsafe.

## Codex Pac-Man

A tiny SwiftBar plugin that tracks your Codex limits — and eats them.

```sh
brew install forkunsafe/tap/codex-pacman
codex-pacman install
```

The first command installs the program and its Python dependency. The second connects it to your existing SwiftBar Plugin Folder using links to Homebrew's stable `opt` path. Codex CLI and SwiftBar must be installed separately:

```sh
brew install --cask codex swiftbar
```

For an existing copied installation, disable only Codex Pac-Man, run `codex-pacman install --update`, and re-enable it. Your native SwiftBar settings and quota state are preserved.

```sh
brew upgrade forkunsafe/tap/codex-pacman
```

After upgrading, Option-click the icon and disable only Codex Pac-Man, run `codex-pacman install --update`, then re-enable it. This makes SwiftBar re-read both code and cached launcher metadata while preserving native settings and state.

To uninstall, disable the plugin, then:

```sh
codex-pacman uninstall
brew uninstall codex-pacman
```

Homebrew does not modify your SwiftBar Plugin Folder during formula installation or removal. The explicit connection/removal commands manage only this plugin. Other plugins and Codex authentication are untouched.

See the [project repository](https://github.com/forkunsafe/codex-pacman) for configuration, requirements, tests, and troubleshooting. MIT licensed.

## Verification

The public `codex-pacman` formula was installed and tested on Apple Silicon:

```sh
brew test forkunsafe/tap/codex-pacman
brew audit --strict forkunsafe/tap/codex-pacman
```

Both checks passed. The project test suite also checks migration from copied files while preserving native settings, stable opt links following a simulated upgrade, and link-swap rollback. Intel Homebrew installation and a real future-version upgrade remain unverified.

## Codex Switcher

Select isolated Personal and Work accounts for Codex CLI.

```sh
brew install forkunsafe/tap/codex-switcher
codex-cli setup
```

Install the official Codex CLI separately if needed: `brew install --cask codex`.
Update with `brew update && brew upgrade forkunsafe/tap/codex-switcher`.

Homebrew upgrades only the utility files and preserves account profiles.
If migrating from a manual installation, check `type -a codex-cli` for an older copy.

The [Codex Switcher project](https://github.com/forkunsafe/codex-switcher), its formula,
update script, and update workflow use Apache License 2.0 with Commons Clause 1.0;
see [LICENSE.codex-switcher](LICENSE.codex-switcher).
The existing tap LICENSE continues to apply to the other tap files.

The update workflow checks stable releases daily and can be run manually.
It verifies the archive SHA256 and formula metadata before committing an update.
Only the built-in repository token is used; no personal token is required.
