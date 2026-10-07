cask "abouteverything" do
  version "0.2.57"
  sha256 "b29d6908a5f91545cc8f5e197c544db77cb0e474ec9777b901568bba34018584"

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
