class Quicklinks < Formula
  desc "Lightweight macOS launcher: hotkey, keyword links, folders and apps"
  homepage "https://github.com/simonbalfe/quicklinks"
  url "https://github.com/simonbalfe/quicklinks/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "4ea9e075c7fcfa59b7246cf1e462973dd98f6ed1e963e8d07d0ce6810956c993"
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
