cask "abouteverything" do
  version "0.2.15"
  sha256 "95145842d601213f2a7793eda26010bf0d77f6b85f0e916172f3342a63f4217f"

  url "https://github.com/needleapdo0610/homebrew-tap/releases/download/v#{version}/abouteverything_#{version}_aarch64.dmg"
  name "abouteverything Beta"
  desc "Local-first work journal and AI secretary for engineers"
  homepage "https://github.com/needleapdo0610/homebrew-tap"

  auto_updates true
  depends_on arch: :arm64

  app "abouteverything.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/abouteverything.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.abouteverything.app",
    "~/Library/Caches/dev.abouteverything.app",
    "~/Library/WebKit/dev.abouteverything.app",
  ]
end
