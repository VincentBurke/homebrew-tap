class CodexTools < Formula
  desc "Native macOS menu bar app for managing multiple Codex auth sessions"
  homepage "https://github.com/VincentBurke/codex-tools"
  version "0.1.3"
  depends_on macos: :sonoma

  on_arm do
    url "https://github.com/VincentBurke/codex-tools/releases/download/v0.1.3/codex-tools-0.1.3-arm64.tar.gz"
    sha256 "66ff8d82b4f954cd740563f7a402f3cc81b5c51302a844c0681236aada99c4f8"
  end

  on_intel do
    url "https://github.com/VincentBurke/codex-tools/releases/download/v0.1.3/codex-tools-0.1.3-x86_64.tar.gz"
    sha256 "2936a70161d40b49ac2f73068fdec95e86edde11b6018587b81701c6631a86df"
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
