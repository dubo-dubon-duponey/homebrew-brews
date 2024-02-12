class Dckr < Formula
  desc "dckr, docker dev helper"
  homepage "https://github.com/dubo-dubon-duponey/dckr"
  version "dev"
  url "https://github.com/dubo-dubon-duponey/dckr.git",
      :revision => "5a8998636acb4a8aec289b090f4583e430965e12"
      #      :tag => "v1.2.0",
      #:revision => "bf794913110c3fb8bb91403319da2abf88ab9b2b"
  head "https://github.com/dubo-dubon-duponey/dckr.git", :branch => "master"

  def install
    bin.install "dckr"
    bin.install Dir["*Dockerfile*"].select { |f| f }
  end

  test do
    system "./test.sh"
  end
end
