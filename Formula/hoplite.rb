class Hoplite < Formula
  desc "Run Hoplite's coding agent from your terminal"
  homepage "https://hoplite.sh"
  version "3.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://hoplite.sh/downloads/releases/3.4.0/hoplite_3.4.0_darwin_arm64.tar.gz"
      sha256 "e95cec666b35cbcb956ab2d4d42dfa133839acbd3b35fe642e972fd28fe81551"
    else
      url "https://hoplite.sh/downloads/releases/3.4.0/hoplite_3.4.0_darwin_amd64.tar.gz"
      sha256 "44969daaaf8e63b327b5fe1b4af750f09047afb9a00ac62135210b3c6cc93026"
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
