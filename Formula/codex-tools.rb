class CodexTools < Formula
  desc "Native macOS menu bar app for managing multiple Codex auth sessions"
  homepage "https://github.com/VincentBurke/codex-tools"
  version "0.1.5"
  depends_on macos: :sonoma

  on_arm do
    url "https://github.com/VincentBurke/codex-tools/releases/download/v0.1.5/codex-tools-0.1.5-arm64.tar.gz"
    sha256 "93ff743e5f1bf4d5c13d37b2f3d1ce3b19e2b686a79a80639e151f82beac1d36"
  end

  on_intel do
    url "https://github.com/VincentBurke/codex-tools/releases/download/v0.1.5/codex-tools-0.1.5-x86_64.tar.gz"
    sha256 "fd00d6278b0f5ecf93fd927ea768cea1ac4178241b75cb0febfb9ffe7dd1a3bd"
  end

  def install
    bin.install "codex-tools"
  end

  service do
    run [opt_bin/"codex-tools"]
    keep_alive true
    run_type :immediate
    process_type :interactive
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
