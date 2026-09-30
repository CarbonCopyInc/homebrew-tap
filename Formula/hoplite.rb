class Hoplite < Formula
  desc "Run Hoplite's coding agent from your terminal"
  homepage "https://hoplite.sh"
  version "3.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://hoplite.sh/downloads/releases/3.2.0/hoplite_3.2.0_darwin_arm64.tar.gz"
      sha256 "251c4faeda26a0797fc987cfa9a958db89951a5ceb3d804ef950f8eb9bd27150"
    else
      url "https://hoplite.sh/downloads/releases/3.2.0/hoplite_3.2.0_darwin_amd64.tar.gz"
      sha256 "05e66bca5483a45b27845988e887539f92b647e9c80b97a7608ac2daf45ca402"
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
