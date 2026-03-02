class CodexTools < Formula
  desc "Native macOS menu bar app for managing multiple Codex auth sessions"
  homepage "https://github.com/VincentBurke/codex-tools"
  version "0.1.16"
  depends_on macos: :sonoma

  on_arm do
    url "https://github.com/VincentBurke/codex-tools/releases/download/v0.1.16/codex-tools-0.1.16-arm64.tar.gz"
    sha256 "459c4b36f26ac959f82bcbbff43c6b95e076d29032cbf4b3d50ee450237a1203"
  end

  on_intel do
    url "https://github.com/VincentBurke/codex-tools/releases/download/v0.1.16/codex-tools-0.1.16-x86_64.tar.gz"
    sha256 "2d0ee7fedc4535d68137dcf7b3389afe8e2dfa656f3d67aa98352da385e0f09f"
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
