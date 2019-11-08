class TerraformProviderGandi < Formula
  desc "Gandi provider for Terraform"
  homepage "https://github.com/tiramiseb/terraform-provider-gandi"
  url "https://github.com/tiramiseb/terraform-provider-gandi/archive/v1.1.1.tar.gz"
  sha256 "b9bc76980250504820b4c66bc31d461c7bd1fad48acbbeab5aa33bf788c8816f"
  head "https://github.com/tiramiseb/terraform-provider-gandi.git"

  depends_on "go" => :build
  depends_on "terraform"

  def install
    ENV["GOPATH"] = buildpath

    terrapath = buildpath/"src/github.com/tiramiseb/terraform-provider-gandi"
    terrapath.install Dir["*"]

    cd terrapath do
      system "go", "build"
      bin.install "terraform-provider-gandi"
      prefix.install_metafiles
    end
  end

  def caveats
    <<~EOS
      To enable this plugin, create or modify $HOME/.terraformrc with:

      providers {
        gandi = "#{HOMEBREW_PREFIX}/bin/terraform-provider-gandi"
      }
    EOS
  end

  test do
    assert_match(/This binary is a plugin/, shell_output("#{bin}/terraform-provider-gandi 2>&1", 1))
  end
end
