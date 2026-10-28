class CodexPacman < Formula
  desc "Tiny SwiftBar plugin that tracks your Codex limits and eats them"
  homepage "https://github.com/forkunsafe/codex-pacman"
  url "https://github.com/forkunsafe/codex-pacman/releases/download/v1.0.2/codex-pacman-1.0.2.tar.gz"
  sha256 "264273ebefe32ddbe82b51572acac012900cae5366d15e4f5365866f0705f31b"
  license "MIT"

  depends_on :macos
  depends_on "python@3.15"

  def install
    libexec.install "VERSION", "cli.py", "install.py", "plugin"
    python = formula_opt_bin("python@3.15")/"python3.15"
    inreplace libexec/"plugin/codex-pacman.sh", "for candidate in ", "for candidate in \"#{python}\" "
    (bin/"codex-pacman").write <<~SH
      #!/bin/sh
      exec "#{python}" -B "#{opt_libexec}/cli.py" "$@"
    SH
  end

  def caveats
    <<~EOS
      Connect the plugin to your existing SwiftBar Plugin Folder:
        codex-pacman install

      Replacing an earlier copied installation? Disable only this plugin, then:
        codex-pacman install --update

      Codex CLI and SwiftBar are required separately:
        brew install --cask codex swiftbar

      Configure Codex Home in SwiftBar Settings. No Codex account data is read
      during installation. After upgrading, Option-click and disable this plugin,
      run `codex-pacman install --update`, then re-enable it to refresh metadata.

      To remove the SwiftBar links, settings, and private state before uninstalling:
        codex-pacman uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codex-pacman --version")
    plugins = testpath/"SwiftBar Plugins"
    plugins.mkpath
    (plugins/"other.1m.sh").write "untouched"
    system bin/"codex-pacman", "install", "--plugin-dir", plugins
    assert_predicate plugins/"codex-pacman.sh", :symlink?
    assert_predicate plugins/".codex-pacman", :symlink?
    system bin/"codex-pacman", "uninstall", "--plugin-dir", plugins
    refute_predicate plugins/"codex-pacman.sh", :symlink?
    assert_equal "untouched", (plugins/"other.1m.sh").read
    assert_path_exists libexec/"plugin/.codex-pacman/main.py"
  end
end
