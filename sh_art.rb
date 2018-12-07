class ShArt < Formula
  desc "ShArt is a load of shcript"
  homepage "https://github.com/dubo-dubon-duponey/sh-art"
  url "https://github.com/dubo-dubon-duponey/sh-art.git",
      :tag => "v0.3.0",
      :revision => "2e97c71dbacbe6a928fbf600abd8bb3fec3c0552"
  head "https://github.com/dubo-dubon-duponey/sh-art.git"

  depends_on "jq"
  # depends_on "ffmpeg"

  def install
    args = %w[
    ]

    # args << "--enable-gpl" if build.with? "gpl"
    # args << "--disable-indev=qtkit" if build.without? "qtkit"

    system "make" "build", *args
#    bin.install Dir["bin/*"].select { |f| File.executable? f }
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
  end

  test do
    system "make", "test-unit"
    system "make", "test-integration"
  end
end
