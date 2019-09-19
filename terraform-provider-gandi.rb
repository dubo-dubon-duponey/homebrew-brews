require "language/go"

class TerraformProviderGandi < Formula
  desc "Gandi provisioner for Terraform"
  homepage "https://github.com/tiramiseb/terraform-provider-gandi"
  url "https://github.com/tiramiseb/terraform-provider-gandi/archive/v1.1.0.tar.gz"
  sha256 "e657882494a996c1ce530cb4e5b1677109a59381312c0de1eab56cab39be301e"
  head "https://github.com/tiramiseb/terraform-provider-gandi.git"

  depends_on "go" => :build
  depends_on "terraform"

  def install
    ENV["GOPATH"] = buildpath

    terrapath = buildpath/"src/github.com/tiramiseb/terraform-provider-gandi"
    terrapath.install Dir["*"]

    Language::Go.stage_deps resources, buildpath/"src"

    cd terrapath do
      system "go", "build"
      bin.install "terraform-provider-gandi"
      prefix.install_metafiles
    end
  end

  def caveats
    <<~EOS
      Once installed a $HOME/.terraformrc file is used to enable the plugin:

      providers {
        gandi = "#{HOMEBREW_PREFIX}/bin/terraform-provider-gandi"
      }
    EOS
  end

  test do
    assert_match(/This binary is a plugin/, shell_output("#{bin}/terraform-provider-gandi 2>&1", 1))
  end
end
