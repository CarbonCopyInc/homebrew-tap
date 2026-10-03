class Hoplite < Formula
  desc "Run Hoplite's coding agent from your terminal"
  homepage "https://hoplite.sh"
  version "3.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://hoplite.sh/downloads/releases/3.3.1/hoplite_3.3.1_darwin_arm64.tar.gz"
      sha256 "b594bcf73fbb8593674bd602b9841bd519bd01f4e71ce0452779ebdb8cd081e4"
    else
      url "https://hoplite.sh/downloads/releases/3.3.1/hoplite_3.3.1_darwin_amd64.tar.gz"
      sha256 "600a40e580f74edc31ee130fbdf1512dd09c8159465d6c11d7b398493f88be0c"
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
