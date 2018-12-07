class Mumbrew < Formula
  desc "Auto updater for homebrew with notifications"
  homepage "https://github.com/dubo-dubon-duponey/mumbrew"
  url "https://github.com/dubo-dubon-duponey/mumbrew.git",
      :tag => "v0.1.0",
      :revision => "1d10344b8c8da75d69ece72fd3f446c8a1e4a418"
  head "https://github.com/dubo-dubon-duponey/mumbrew.git"

  depends_on "dubo-dubon-duponey/brews/sh_art" => :build
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
    system "dc-tooling-lint", "."
  end
end
