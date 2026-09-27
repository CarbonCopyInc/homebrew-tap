class Hoplite < Formula
  desc "Run Hoplite's coding agent from your terminal"
  homepage "https://hoplite.sh"
  version "3.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://hoplite.sh/downloads/releases/3.0.0/hoplite_3.0.0_darwin_arm64.tar.gz"
      sha256 "e25936cb3c70782c0decae8194063a1347730a6ab177e81de69f89b6c9935a80"
    else
      url "https://hoplite.sh/downloads/releases/3.0.0/hoplite_3.0.0_darwin_amd64.tar.gz"
      sha256 "aef6fe4b21b2f34468f9a137a79bd6cf03fd92b43c989764b5a5bcf682731b1b"
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
