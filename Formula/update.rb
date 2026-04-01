class Update < Formula
  desc "Agent-first macOS app update checker and installer"
  homepage "https://github.com/sammyjoyce/update"
  version "1.0.0"

  depends_on macos: :sonoma

  on_arm do
    url "https://github.com/sammyjoyce/update/releases/download/v1.0.0/update-macos-arm64.tar.gz"
    sha256 "50267c3beeab2880d93954aef641a530a5fb283cc8c3984b44eff0a4c0906c56"
  end

  on_intel do
    url "https://github.com/sammyjoyce/update/releases/download/v1.0.0/update-macos-x86_64.tar.gz"
    sha256 "a5dc520dce7de1682b87a182e43d62e5252ca7582848b72ee8206ec5c7c28ac4"
  end

  def install
    bin.install "update"
    bash_completion.install "completions/update.bash" => "update"
    zsh_completion.install "completions/_update"
    fish_completion.install "completions/update.fish"
    doc.install "README.md"
  end

  test do
    assert_match "Agent-first macOS app update checker and installer", shell_output("#{bin}/update --help")
  end
end
