class Dckr < Formula
  desc "ShArt is a load of shcript"
  homepage "https://github.com/dubo-dubon-duponey/dckr"
  url "https://github.com/dubo-dubon-duponey/dckr.git",
      :tag => "v0.1.0",
      :revision => "a2cc96ae6e154a8cbe3cac2f94e70e7984175e08"
  head "https://github.com/dubo-dubon-duponey/dckr.git"

  def install
    bin.install "dckr"
    bin.install Dir["*Dockerfile*"].select { |f| f }
  end

end
