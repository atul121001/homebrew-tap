# Generated from packaging/homebrew/mcpload.rb.tmpl in atul121001/mcpload by
# the release workflow. Do not edit by hand: changes are overwritten on the
# next release.
class Mcpload < Formula
  desc "AI-agent load & soak testing for MCP servers"
  homepage "https://github.com/atul121001/mcpload"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atul121001/mcpload/releases/download/v0.4.1/mcpload_0.4.1_darwin_arm64.tar.gz"
      sha256 "e0a85dc86b3c3938c11b42c0b5898e2632bc37f1eca7eb3007a6a78f2c22edca"
    else
      url "https://github.com/atul121001/mcpload/releases/download/v0.4.1/mcpload_0.4.1_darwin_amd64.tar.gz"
      sha256 "f93cd726cd6bbd4aa5026f54268e20ae104aa91dc6cb644c25a0279b19a9e51c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atul121001/mcpload/releases/download/v0.4.1/mcpload_0.4.1_linux_arm64.tar.gz"
      sha256 "f53f844aa2d3a77c871d03b3fe6c43d8ff02e5cf40d4ecdc5041ec1992b63dc1"
    else
      url "https://github.com/atul121001/mcpload/releases/download/v0.4.1/mcpload_0.4.1_linux_amd64.tar.gz"
      sha256 "4b675e639eb57381c3b1f8c2533812f21402cb9c4b46b0eed7b2ef1b0e340cf9"
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
