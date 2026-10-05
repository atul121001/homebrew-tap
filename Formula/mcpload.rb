# Generated from packaging/homebrew/mcpload.rb.tmpl in atul121001/mcpload by
# the release workflow. Do not edit by hand: changes are overwritten on the
# next release.
class Mcpload < Formula
  desc "AI-agent load & soak testing for MCP servers"
  homepage "https://github.com/atul121001/mcpload"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/atul121001/mcpload/releases/download/v0.5.0/mcpload_0.5.0_darwin_arm64.tar.gz"
      sha256 "c6970b54600f7b99afac59d9494961a5d97378b6bef631951b419ec83d273cc2"
    else
      url "https://github.com/atul121001/mcpload/releases/download/v0.5.0/mcpload_0.5.0_darwin_amd64.tar.gz"
      sha256 "f98964b5596d2354e6edafbccf8e20e12623a7d35a78d69061743d2446edef19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/atul121001/mcpload/releases/download/v0.5.0/mcpload_0.5.0_linux_arm64.tar.gz"
      sha256 "1d1e5b10295301b338035aa55f34c4c74a27b9044c2b5ad3c38f32813a4b40ee"
    else
      url "https://github.com/atul121001/mcpload/releases/download/v0.5.0/mcpload_0.5.0_linux_amd64.tar.gz"
      sha256 "e8a2e54799c1e799eca71bb3188cfdc923a7f384030337e2a167832bad0cd670"
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
