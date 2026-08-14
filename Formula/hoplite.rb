class Hoplite < Formula
  desc "Import local coding-agent history into Hoplite"
  homepage "https://hoplite.sh"
  version "2.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://hoplite.sh/downloads/releases/2.3.1/hoplite_2.3.1_darwin_arm64.tar.gz"
      sha256 "48873e12dc2ef464540e388cbd24d6d9d6475fe36241359a9f234371b6c2e183"
    else
      url "https://hoplite.sh/downloads/releases/2.3.1/hoplite_2.3.1_darwin_amd64.tar.gz"
      sha256 "44a34dde636f3fa3a3610a230049b9f848647bcfeb54f61f6f347ba88d40b776"
    end
  end

  def install
    bin.install "hoplite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hoplite --version")
  end
end
