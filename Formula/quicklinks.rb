class Quicklinks < Formula
  desc "Tiny macOS launcher: hotkey, keyword links, folders and apps"
  homepage "https://github.com/simonbalfe/quicklinks"
  url "https://github.com/simonbalfe/quicklinks/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d7c3aca05a9b6b2c988daade05a928dbda236734b632ebd63c378ee60602ad38"
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
