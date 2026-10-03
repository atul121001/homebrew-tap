# Generated from packaging/homebrew/mcpload.rb.tmpl in atul121001/mcpload by
# the release workflow. Do not edit by hand: changes are overwritten on the
# next release.
class Mcpload < Formula
  desc "Load and soak testing for remote MCP servers"
  homepage "https://github.com/atul121001/mcpload"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atul121001/mcpload/releases/download/v0.4.0/mcpload_0.4.0_darwin_arm64.tar.gz"
      sha256 "6b93944ba70c6b90d849ddc90c3ce4d2cb6b528fe32b17480901dd9e1208548a"
    else
      url "https://github.com/atul121001/mcpload/releases/download/v0.4.0/mcpload_0.4.0_darwin_amd64.tar.gz"
      sha256 "9578cf72e0967f6e174af094aa30948d76082ae0fa56057bc880354ae16ae473"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atul121001/mcpload/releases/download/v0.4.0/mcpload_0.4.0_linux_arm64.tar.gz"
      sha256 "b8317f274e81ccc0ffb976e2d6e141c2204093700036be1af301536cffbce5d7"
    else
      url "https://github.com/atul121001/mcpload/releases/download/v0.4.0/mcpload_0.4.0_linux_amd64.tar.gz"
      sha256 "61fe57ad27f9b15ce40910d2a6cdf85e79cea5fb7003f6abf311abceb4c7917c"
    end
  end

  def install
    # The whole release folder (mcpload, scenarios/, README, LICENSE) goes into
    # libexec; only mcpload is linked into bin. mcpload resolves the symlink and
    # finds scenarios/ next to its real location.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"mcpload"
  end

  test do
    assert_match "mcpload v#{version}", shell_output("#{bin}/mcpload version")
  end
end
