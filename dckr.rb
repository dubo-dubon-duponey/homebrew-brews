class Dckr < Formula
  desc "ShArt is a load of shcript"
  homepage "https://github.com/dubo-dubon-duponey/dckr"
  url "https://github.com/dubo-dubon-duponey/dckr.git",
      :tag => "v0.1.0",
      :revision => "41098ebd5de4c58c2db4794bff5c26a0bf3b9530"
  head "https://github.com/dubo-dubon-duponey/dckr.git"

  def install
    bin.install "dckr"
    bin.install Dir["*Dockerfile*"].select { |f| f }
  end

end
