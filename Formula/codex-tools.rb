class CodexTools < Formula
  desc "Native macOS menu bar app for managing multiple Codex auth sessions"
  homepage "https://github.com/VincentBurke/codex-tools"
  version "0.1.4"
  depends_on macos: :sonoma

  on_arm do
    url "https://github.com/VincentBurke/codex-tools/releases/download/v0.1.4/codex-tools-0.1.4-arm64.tar.gz"
    sha256 "a0259052f10f54a6438140ebfed1b98759b73936d262936846ba425c77179eeb"
  end

  on_intel do
    url "https://github.com/VincentBurke/codex-tools/releases/download/v0.1.4/codex-tools-0.1.4-x86_64.tar.gz"
    sha256 "1d254d05e2dd9f2613f83e0cd50bc32aae0fcb22d68bee56e3dcbbcaf7e27582"
  end

  def install
    bin.install "codex-tools"
  end

  service do
    run [opt_bin/"codex-tools"]
    keep_alive true
    run_type :immediate
  end

  test do
    assert_predicate bin/"codex-tools", :exist?
  end

  def caveats
    <<~EOS
      Start the menu bar app:
        brew services start codex-tools

      Stop it:
        brew services stop codex-tools
    EOS
  end
end
