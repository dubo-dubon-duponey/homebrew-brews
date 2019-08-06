class Dckr < Formula
  desc "dckr, docker dev helper"
  homepage "https://github.com/dubo-dubon-duponey/dckr"
  url "https://github.com/dubo-dubon-duponey/dckr.git",
      :tag => "v1.1.0",
      :revision => "e14603f76a4aca0fc3a489306c6fb616bb27998e"
  head "https://github.com/dubo-dubon-duponey/dckr.git", :branch => "master"

  def install
    bin.install "dckr"
    bin.install Dir["*Dockerfile*"].select { |f| f }
  end

  test do
    system "./test.sh"
  end

end
