cask "abouteverything" do
  version "0.2.1"
  sha256 "c3d553b121849853a2733ac630ff8e4a74ab396734a0f8bf4950e99dd9b7c5fd"

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
