class Quicklinks < Formula
  desc "Lightweight macOS launcher: hotkey, keyword links, folders and apps"
  homepage "https://github.com/simonbalfe/quicklinks"
  url "https://github.com/simonbalfe/quicklinks/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "479aed1c8153b08d8ec536a21cbd843668f7a02e5090b7271aa211677410fa62"
  license "MIT"

  depends_on macos: :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/quicklinks"
  end

  service do
    run [opt_bin/"quicklinks"]
    keep_alive true
  end

  test do
    assert_match "keyword launcher", shell_output("#{bin}/quicklinks --help")
  end
end
