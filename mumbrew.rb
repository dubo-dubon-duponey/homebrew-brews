class Mumbrew < Formula
  desc "Auto updater for homebrew with notifications"
  homepage "https://github.com/dubo-dubon-duponey/mumbrew"
  head "https://github.com/dubo-dubon-duponey/mumbrew.git"

  depends_on "terminal-notifier"

  def install
    bin.install "mumbrew"
  end


  plist_options :manual => "mumbrew"

  def plist; <<-EOS.undent
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
    #
  end
end
