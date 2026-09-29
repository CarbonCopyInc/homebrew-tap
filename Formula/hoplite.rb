class Hoplite < Formula
  desc "Run Hoplite's coding agent from your terminal"
  homepage "https://hoplite.sh"
  version "3.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://hoplite.sh/downloads/releases/3.1.0/hoplite_3.1.0_darwin_arm64.tar.gz"
      sha256 "98c42d3a5540f788638d055fabf4175536ca29ccc19ce1612508ea5495f4d15d"
    else
      url "https://hoplite.sh/downloads/releases/3.1.0/hoplite_3.1.0_darwin_amd64.tar.gz"
      sha256 "5442f21badbca631ff39eb89c3a9278aaf57998b72a0a6dc71053615bfb641ea"
    end
  end

  def install
    # `hoplite` runs `hoplite-legacy` for the commands it has not ported yet.
    bin.install "hoplite", "hoplite-legacy"
    bin.install_symlink "hoplite" => "hplt"
    (share/"doc/hoplite/third_party").install Dir["third_party/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hoplite --version")
    assert_match version.to_s, shell_output("#{bin}/hoplite-legacy version")
  end
end
