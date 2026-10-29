class CodexSwitcher < Formula
  desc "Select isolated Personal and Work accounts for Codex CLI"
  homepage "https://github.com/forkunsafe/codex-switcher"
  url "https://github.com/forkunsafe/codex-switcher/releases/download/v1.0.1/codex-switcher-1.0.1.tar.gz"
  sha256 "ccf1b9f47575c7d82c4a8729e4421ff78cafe2ad73ad5ecd5c3e2b6482d6aaf3"
  license :cannot_represent

  depends_on :macos

  def install
    libexec.install "codex-cli", "codex-session-paths.sh", "install.sh", "VERSION"
    bin.write_exec_script libexec/"codex-cli"
  end

  def caveats
    <<~EOS
      License: Apache License 2.0 with Commons Clause 1.0 (source-available).
      Install the official Codex CLI separately if needed: brew install --cask codex
      Before first use, configure isolated accounts: codex-cli setup
      If upgrading from the manual installer, an older ~/.local/bin/codex-cli
      may take precedence. Check with: type -a codex-cli
      Homebrew upgrades do not modify account profiles or stop Codex processes.
    EOS
  end

  test do
    assert_match "codex-switcher #{version}", shell_output("#{bin}/codex-cli --switcher-version")
    assert_predicate libexec/"codex-session-paths.sh", :exist?
    assert_predicate libexec/"install.sh", :exist?
    refute_path_exists testpath/".codex-personal"
    refute_path_exists testpath/".codex-work"
  end
end
