class Regander < Formula
  desc "Regander! Make them registries behave!"
  homepage "https://github.com/dubo-dubon-duponey/regander"
  url "https://github.com/dubo-dubon-duponey/regander.git",
      :tag => "v0.0.1",
      :revision => "53195392d89ddbc1b407bb770905153a5f2f48e4"
  head "https://github.com/dubo-dubon-duponey/regander.git"

  depends_on "jq"
  # depends_on "ffmpeg"

  def install
    # system "make" "build", *args
    system "make", "build", "-j", "1"
    bin.install Dir["bin/*"].select { |f| File.executable? f }
    # bin.install Dir["bin/*"]
  end

  test do
    system "make", "test"
  end
end
