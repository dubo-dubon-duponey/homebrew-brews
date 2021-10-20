class TerraformProviderDocker < Formula
  desc "Gandi provider for Terraform"
  homepage "https://github.com/kreuzwerker/terraform-provider-docker"
  url "https://github.com/kreuzwerker/terraform-provider-docker/archive/v2.15.0.tar.gz"
  sha256 "1758306a74df4d5e413323d2dad7507993505bd897324e997ccf2cbf67bb494b"
  head "https://github.com/kreuzwerker/terraform-provider-docker.git"

  depends_on "go" => :build
  depends_on "terraform"

  def install
    ENV["GOPATH"] = buildpath

    ENV["CGO_ENABLED"] = "1"

    terrapath = buildpath/"src/github.com/kreuzwerker/terraform-provider-docker"
    terrapath.install Dir["*"]

    cd terrapath do
      system "go", "build"
      bin.install "terraform-provider-docker"
      prefix.install_metafiles
    end
  end

  def caveats
    <<~EOS
      To enable this plugin, create or modify $HOME/.terraformrc with:

      providers {
        gandi = "#{HOMEBREW_PREFIX}/bin/terraform-provider-docker"
      }
    EOS
  end

  test do
    assert_match(/This binary is a plugin/, shell_output("#{bin}/terraform-provider-docker 2>&1", 1))
  end
end
