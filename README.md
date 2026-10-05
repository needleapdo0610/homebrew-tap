# needleapdo0610/tap

Homebrew tap and downloads for **abouteverything**, a local-first work journal and AI secretary for engineers (macOS, Apple Silicon).

## 安裝 / Install

```sh
brew install --cask needleapdo0610/tap/abouteverything
```

第一次打開會有新手導覽，帶你檢查工具（git、Claude Code / Codex CLI）並說明每個 macOS 權限要按什麼。

The first launch opens a setup guide that checks your tools and explains each macOS permission prompt.

## 更新 / Updates

App 會自動檢查新版本。有新版時，左側欄底部會出現「有新版本」，點開看更新內容、按「下載並重新啟動」即可。也可以到 **設定 → 關於與更新 → 檢查更新**。

The app checks for updates on its own. When one is available, a badge appears at the bottom of the sidebar; click it to read the notes and install. You can also check manually in **Settings → 關於與更新**.

## 如果 macOS 擋住 app / If macOS blocks the app

這個 app 還沒有 Apple 公證。如果出現「無法驗證開發者」，到 **系統設定 → 隱私權與安全性**，往下捲，按 abouteverything 旁的 **強制打開**。

The app is not notarized by Apple yet. If macOS says the developer cannot be verified, open **System Settings → Privacy & Security**, scroll down, and click **Open Anyway**.

## 移除 / Uninstall

```sh
brew uninstall --cask abouteverything          # keep your data
brew uninstall --zap --cask abouteverything    # also delete local data
```

Tokens stay in the macOS Keychain under `dev.abouteverything.app`; remove them in Keychain Access if you want a clean slate.
