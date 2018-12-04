class Dckr < Formula
  desc "ShArt is a load of shcript"
  homepage "https://github.com/dubo-dubon-duponey/dckr"
  url "https://github.com/dubo-dubon-duponey/dckr.git",
      :tag => "v0.0.1",
      :revision => "2321cb2b2a1db6f56edbff654954de71f45e8781"
  head "https://github.com/dubo-dubon-duponey/dckr.git"

  def install
    bin.install "dckr"
    bin.install Dir["Dockerfile.*"].select { |f| f }
  end

end
