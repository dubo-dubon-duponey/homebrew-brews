class Mumbrew < Formula
  desc "Auto updater for homebrew with notifications"
  homepage "https://github.com/dubo-dubon-duponey/mumbrew"
  url "https://github.com/dubo-dubon-duponey/mumbrew.git",
      :tag => "v1.0.0",
      :revision => "85ff7fda8b81c0dcbf8cb725b44d8d46653a266b"
  head "https://github.com/dubo-dubon-duponey/mumbrew.git"

  depends_on "terminal-notifier"

  def install
    bin.install "mumbrew"
  end

  plist_options :manual => "mumbrew"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>EnableGlobbing</key>
        <false/>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>/bin/bash</string>
          <string>#{opt_bin}/mumbrew</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>StandardErrorPath</key>
        <string>#{var}/log/mumbrew.err</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/mumbrew.out</string>
        <key>StartCalendarInterval</key>
        <array>
          <dict>
            <key>Hour</key>
            <integer>22</integer>
            <key>Minute</key>
            <integer>0</integer>
          </dict>
          <dict>
            <key>Hour</key>
            <integer>7</integer>
            <key>Minute</key>
            <integer>0</integer>
          </dict>
        </array>
      </dict>
    </plist>
  EOS
  end

  test do
    system "./test.sh"
  end
end
