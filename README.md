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

Refresh only Codex Pac-Man in SwiftBar after upgrading to restart the stream with the new code.

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
