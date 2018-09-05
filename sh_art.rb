class SHArt < Formula
  desc "A load of shcript"
  homepage "https://github.com/dubo-dubon-duponey/sh-art"
  head "https://github.com/dubo-dubon-duponey/sh-art.git"

  def install
    args = %W[
    ]

    system "./build", *args
    bin.install Dir["bin"].select { |f| File.executable? f }
    libexec.install "lib/*"
  end
end
