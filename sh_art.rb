class ShArt < Formula
  desc "ShArt is a load of shcript"
  homepage "https://github.com/dubo-dubon-duponey/sh-art"
  url "https://github.com/dubo-dubon-duponey/sh-art.git",
      :tag => "v0.0.1",
      :revision => "2e2e2a1ff6df12d6c27e19d8cd9e3b2415d8d65f"
  head "https://github.com/dubo-dubon-duponey/sh-art.git"

  def install
    args = %w[
    ]

    # args << "--enable-gpl" if build.with? "gpl"
    # args << "--disable-indev=qtkit" if build.without? "qtkit"

    system "./build", *args
#    bin.install Dir["bin/*"].select { |f| File.executable? f }
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
  end

  test do
    system "./lint"
    system "./unit"
    system "./integration"
  end
end
