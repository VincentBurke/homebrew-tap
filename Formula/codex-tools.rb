class CodexTools < Formula
  desc "Native macOS menu bar app for managing multiple Codex auth sessions"
  homepage "https://github.com/VincentBurke/codex-tools"
  version "0.1.17"
  depends_on macos: :sonoma

  on_arm do
    url "https://github.com/VincentBurke/codex-tools/releases/download/v0.1.17/codex-tools-0.1.17-arm64.tar.gz"
    sha256 "ca9cd71b2a9519a3328e4573ca47e4a45b0f4ef3395ce9409aa08b6b3e775a6a"
  end

  on_intel do
    url "https://github.com/VincentBurke/codex-tools/releases/download/v0.1.17/codex-tools-0.1.17-x86_64.tar.gz"
    sha256 "3cc76b6e9484e93c2a732ad4ced27cc8f1006e8ad61dd4acffac62defe0390d0"
  end

  def install
    bin.install "codex-tools"
  end

  service do
    run [opt_bin/"codex-tools"]
    keep_alive successful_exit: false
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
