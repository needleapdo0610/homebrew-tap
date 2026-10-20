cask "abouteverything" do
  version "0.18.5"
  sha256 "c95dd9b49db343fa9c1e53bfed6e8097688d33f91192060e923617fd45c508f3"

  url "https://github.com/needleapdo0610/homebrew-tap/releases/download/v#{version}/abouteverything_#{version}_aarch64.dmg"
  name "abouteverything Beta"
  desc "Local-first work journal and AI secretary for engineers"
  homepage "https://github.com/needleapdo0610/homebrew-tap"

  auto_updates true
  depends_on arch: :arm64

  app "abouteverything.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/abouteverything.app"], writable_paths: ["abouteverything.app"], writable_base: :appdir
  end

  zap trash: [
    "~/Library/Application Support/dev.abouteverything.app",
    "~/Library/Caches/dev.abouteverything.app",
    "~/Library/WebKit/dev.abouteverything.app",
  ]
end
