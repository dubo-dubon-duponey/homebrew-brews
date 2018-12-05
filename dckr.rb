class Dckr < Formula
  desc "ShArt is a load of shcript"
  homepage "https://github.com/dubo-dubon-duponey/dckr"
  url "https://github.com/dubo-dubon-duponey/dckr.git",
      :tag => "v0.0.2",
      :revision => "af40034a6cd0a9d5414bb51c62d0fdd978205674"
  head "https://github.com/dubo-dubon-duponey/dckr.git"

  def install
    bin.install "dckr"
    bin.install Dir["*Dockerfile*"].select { |f| f }
  end

end
