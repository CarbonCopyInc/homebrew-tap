class Hoplite < Formula
  desc "Run Hoplite's coding agent from your terminal"
  homepage "https://hoplite.sh"
  version "3.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://hoplite.sh/downloads/releases/3.3.0/hoplite_3.3.0_darwin_arm64.tar.gz"
      sha256 "35b40d23ca50434e9975a5d283ad4dce10bb156518fece8bc5e291c2dfe3c5e4"
    else
      url "https://hoplite.sh/downloads/releases/3.3.0/hoplite_3.3.0_darwin_amd64.tar.gz"
      sha256 "cc33219fafa6de644213e46da0ceecfc6f1e0fc6f9c97cb9257fec1947151787"
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
