cask "abouteverything" do
  version "0.2.134"
  sha256 "97ec2f1cda684cd67707add2c71ecb18818693e1a3c2cfb8b60a894245cf9a62"

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
