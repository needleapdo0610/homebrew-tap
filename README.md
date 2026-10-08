# abouteverything

> **你做過的每一件事，都有證據。**
> *Everything you did. With receipts.*

給工程師用的本機工作日誌 + AI 小秘書（macOS，Apple Silicon）。

它會自己看你的 git repo、GitHub PR、Jira ticket，幫你記筆記、每天早上寫好 standup，期末幫你把一整季的工作整理成主管看得懂的報告。資料只存在你的 Mac 上。

> **Beta**：v1.0.0 之前都是 Beta，功能和畫面還會持續調整，更新會透過 app 內通知推送。

[English summary ↓](#english)

---

## 適合誰

- Standup 的時候想不起來昨天做了什麼。
- 寫考績、季報時，要翻遍 Jira 和 GitHub 一整年的紀錄。
- 想法散落在 Slack 傳給自己的訊息、便利貼、一堆 `.md` 檔裡。
- 想把小的開發需求丟給 Claude Code / Codex 做，但希望看得到它在幹嘛、最後由自己決定要不要 push。

## 它能做什麼

| 功能 | 說明 |
|---|---|
| **首頁** | 今天的時間（會議 vs 可專注）、需要你回應的 PR、進行中的 ticket、小秘書提醒、Sprint 進度、18 週活動熱圖。分成幾個 tab，版面可拖曳；自訂區塊有編輯器（JSON、即時預覽，或請小秘書設計），可用 JSON 分享給同事 |
| **Spaces** | 依團隊切換工作範圍（本機 repo、GitHub org / repo、Jira 專案）。首頁與月曆上方或 `⌘1–9` 切換，可多選；過濾首頁、月曆、Jira 與各區塊，每個 space 有自己的首頁版面 |
| **隨手記** | 在任何 app 按 `⌘⇧Space` 就能記。支援 `#tag`、打勾完成、搜尋，每則可設提醒（明天早上 9 點 / 下週一 / 自訂）、連 Jira 單號，「AI 整理未完成」交給小秘書 |
| **Daily report** | 每天早上自動寫好「昨天完成 / 今天預計」（含行事曆會議），先看它用了哪些資料、選要涵蓋的 space，再複製或直接貼到 Teams 頻道 / 聊天 / 私訊（有重複貼文防呆） |
| **報告** | 把一段期間的工作整理成簡報或文件（1:1、雙月更新、貢獻報告、年度自評），逐頁和小秘書校稿，匯出 PDF |
| **AI 小秘書** | 用聊天問你的工作狀態（看得到你目前的畫面）、附檔案給它看、改設定（先看差異再執行）、按一下幫你跑指令、一步步帶你完成設定、記住關於你的事、幫你開報告。有定時自動提醒和「等你決定」收件匣 |
| **任務 / AI-DLC** | 把開發需求派給 Claude Code、Codex 或 omp，在獨立的 git worktree（或直接在 repo 裡）改程式、跑測試；AI-DLC 流程從計畫、設計審查、實作、review agent、PR 到驗收，每個決策是一張卡片給你選。另有比賽模式、排程自動化、CLI 工作台 |
| **月曆 / Jira / AI 日誌** | 每天做了什麼（含 Microsoft 365 會議）、Jira 看板、每次 AI 呼叫花了多少 token |
| **外觀** | 中 / 英介面、主題包（匯入 / 匯出 / AI 產生）、玻璃效果、小秘書造型、明暗、文字大小 |

AI 可以用你**現有的 Claude 或 ChatGPT 訂閱**（透過 Claude Code / Codex CLI，不用 API key），也可以接任何 OpenAI 相容的 API 或 omp；可同時設多組，左下角看得到用量與額度。

---

## 安裝（約 3 分鐘）

需要：Apple Silicon Mac（M1 以上）、[Homebrew](https://brew.sh)。

```sh
brew install --cask needleapdo0610/tap/abouteverything
```

裝好後從「應用程式」或 Spotlight 打開 **abouteverything**。

> **macOS 說「無法驗證開發者」？** 這個 app 還沒有 Apple 公證。到 **系統設定 → 隱私權與安全性**，往下捲，按 abouteverything 旁的 **強制打開**。只需要做一次。

---

## 第一次設定（約 10 分鐘）

第一次打開會出現**新手導覽**，會即時檢查每一項有沒有設定好，沒裝的工具會給你一鍵在 Terminal 執行的按鈕。照著做就好，下面是它會帶你做的事：

1. **確認工具**
   - `git`（必要）：沒有的話執行 `xcode-select --install`
   - Claude Code CLI（用 Claude 訂閱）：`brew install --cask claude-code`，然後 `claude auth login`
   - Codex CLI（用 ChatGPT 訂閱）：`brew install --cask codex`，然後 `codex login`
   - GitHub CLI（任務開 PR 用，選用）：`brew install gh`，然後 `gh auth login`

   Claude 和 Codex 裝一個就夠。都沒有訂閱的話，可以在 **設定 → AI Provider** 填 OpenAI 相容的 URL + key。
2. **選要追蹤的資料夾**：例如 `~/Documents/code`。它會往下找 4 層內所有 git repo，只讀 commit 紀錄，不會複製程式碼。
3. **填你的 git email**：用來只算你自己的 commit。公司和個人用不同 email 的話兩個都填。
4. **選 AI Provider 並按 Connect 測試**（約 1,000 tokens）。
5. **（選用）連 GitHub / Jira / Outline / Microsoft 365**：在 **設定 → Connectors**。Token 只存在 macOS 鑰匙圈。
   - GitHub：支援 github.com 和 GitHub Enterprise，可以設多組
   - Jira：Cloud 用 email + API token，Server / Data Center 用 PAT
   - Outline：API key，連上後小秘書可以查公司 wiki、幫你起草文件
   - Microsoft 365：Teams 聊天與行事曆（唯讀），用公司核准的 App 登入；行事曆資料只交給你勾選的核准 AI
6. **（選用）建 Spaces**：在 **設定 → 工作區** 依團隊建立 space（repo、org、Jira 專案），之後首頁上方切換。不建的話就是「全部」。

導覽之後可以從 **設定 → 外觀 → 重新開啟新手導覽** 再打開。

### macOS 會跳出的權限

| 跳出什麼 | 什麼時候 | 按什麼 | 為什麼 |
|---|---|---|---|
| 存取「文件」（或桌面、下載） | 第一次同步 | **允許** | 讀你選的資料夾裡 repo 的 git 紀錄 |
| 使用鑰匙圈中的機密資訊 | 第一次用到 token | 輸入 Mac 密碼 → **永遠允許** | Token 和 API key 只存在鑰匙圈 |
| 控制「終端機」 | 第一次按「在 Terminal 開啟」類按鈕 | **好** | App 幫你把指令打進 Terminal，你自己按 Enter |
| 「工序指令編寫程式」的通知 | 第一次 daily report 提醒 | **允許** | 提醒透過 macOS 通知送出 |

---

## 日常怎麼用

### 早上：寫 standup（1 分鐘）

1. 打開 **報告 → Daily report**。設定「工作日自動產生」的話（預設 09:30），打開時已經寫好了。
2. 看一下內容，有不對的直接改。想知道它用了哪些資料，展開「這份會用到的資料」。
3. 按 **複製** 貼到團隊頻道，或在右側設定 **Teams 目的地**（頻道、聊天、或某個人）後直接送出；送出前會先預覽，貼過的不會重複貼。

內容來自上個工作日以來的 commit（週一會包含週末）、PR / Jira 狀態變化、行事曆會議、還沒 commit 的改動、未完成的隨手記。格式、項目符號、日期寫法、涵蓋哪些 space 在右側設定可以改。

### 工作中：隨手記

- 在任何 app 按 **`⌘⇧Space`** 跳出筆記框，打完按 Enter。
- 加 `#tag` 分類，例如 `問 PM sprint 範圍 #todo`；提到 Jira 單號會自動連過去。
- 首頁「追蹤事項」區塊的輸入框也可以記。
- 做完了在 **隨手記** 頁打勾；怕忘就設提醒（明天早上 9 點 / 下週一 / 自訂），時間到小秘書會在提醒清單叫你。
- 累積太多就按 **AI 整理未完成**，小秘書會依主題分組、對到 Jira。

### 想知道狀態：問小秘書

點右下角的小秘書，直接用中文問，例如：

- 「我這週做了什麼？」
- 「哪些 PR 在等我 review？」
- 「幫我在首頁加一個區塊：本 sprint 指派給我、還沒完成的 ticket，依狀態分組」
- 「記住：我負責的是付款模組」
- 「幫我把這個 zip 裡的 log 看一下」（拖檔案進對話框，圖片、PDF、Office 文件、壓縮檔都可以）
- 「幫我設定 Microsoft 365 連線」（它會一步一步帶你做）

小秘書要改設定、跑指令或寫東西出去之前，一定會先給你看差異或指令，你按 **執行** 才會動。它記住的事情可以在小秘書視窗的 **🧠 記憶** 分頁查看、修改、刪除。

### 要寫報告：1:1、季報、考績

1. 打開 **報告 → 報告**，選用途模板（主管 1:1、雙月更新、貢獻報告、年度自評，或自訂）。
2. 選期間，例如「上次報告至今」「今年至今」。
3. 補充資料裡看不到的事。沒頭緒就按 **✦ 沒頭緒？小秘書幫我想**。
4. 選簡報（16:9）或文件（A4）和配色，按 **產生**（約 1–2 分鐘，在背景跑）。
5. 點任何一頁就能只改那一頁，或在右側和小秘書來回校稿。每個版本都能還原。
6. 匯出 PDF 或 HTML。

也可以直接跟小秘書說「幫我做 XX 專案的介紹報告」，它會挑好模板和期間。

### 派開發任務給 AI

兩種方式：**AI-DLC**（有流程、有決策卡片，適合正式需求）和 **任務**（自由對話的 session，適合小改動或實驗）。

1. 打開 **AI-DLC**，按 **＋ 新流程**，從 Jira 單開始或直接描述需求，可以附截圖。
2. App 會在 repo 旁建立獨立的 git worktree 和分支（也可以選直接在 repo 裡做），由 Claude Code、Codex 或 omp 在裡面改程式、跑測試、commit。
3. 流程：S1–S2 計畫與設計 → **設計審查卡片**（你按 ★ 核准或寫備註要改）→ S3–S4 實作與自測 → S5 review agent → 自動開 Draft PR 並處理 review 意見 → **驗收卡片** → merge。每張卡片都有 AI 建議的選項，回答後它自己接著做。
4. 執行中隨時可以留言、停止、換另一個 AI 接手；完成後看 diff，或開資料夾 / Terminal / CLI 工作台自己測。
5. 對話框打 **結單** 就結束；session 可以封存或刪除，worktree 都會保留。

---

## 會花多少 AI 額度

用訂閱（Claude / Codex）的話從訂閱額度扣，不另外收費。每次呼叫都記在 **AI 日誌**。

| 動作 | 大約 tokens |
|---|---|
| 同步 git / GitHub / Jira | 0（不用 AI） |
| 和小秘書聊一則 | 3–6k |
| 每日回顧 | 2–6k |
| Daily report | 5–8k |
| 小秘書自動提醒（每次） | 1–3k |
| AI-DLC 一個流程 | 幾萬起跳，看需求大小 |
| 產生一份報告 | 20–40k |
| 報告校稿一輪 | 20–35k |

每天的小秘書 token 上限可以在 **設定 → AI 小秘書** 調整；每一筆都看得到完整送出內容與回覆。

---

## 資料與隱私

- 所有資料存在你的 Mac：`~/Library/Application Support/dev.abouteverything.app/`（一個 SQLite 檔）。
- Token、API key 存在 macOS 鑰匙圈（`dev.abouteverything.app`）。
- 只存 commit 的 hash、作者、時間、標題、行數。**不會複製程式碼或 diff。**
- 除了你設定的 AI provider、connectors，以及到這個 repo 檢查更新，不會連到其他地方。

---

## 更新

App 會自己檢查新版本。有新版時左側欄底部會出現 **有新版本**，點開看更新內容、按 **下載並重新啟動**。也可以到 **設定 → 關於與更新 → 檢查更新**。

更新檔有簽章，安裝前會驗證。

## 移除

```sh
brew uninstall --cask abouteverything          # 移除 app，保留資料
brew uninstall --zap --cask abouteverything    # 連本機資料一起刪除
```

鑰匙圈裡的 token 要另外刪：打開「鑰匙圈存取」，搜尋 `dev.abouteverything.app`。

## 常見問題

**鑰匙圈一直要密碼？** 按一次 **永遠允許** 就好。重新安裝後會再問一次。

**首頁沒有 PR？** 確認 **設定 → Connectors** 裡的 GitHub 帳號是你工作用的那個（公司 repo 可能在另一個帳號或 Enterprise 主機）。

**Codex 說 model 不支援？** 到 **設定 → AI Provider** 換成你帳號支援的 model，再按 Connect。

**按紅色 × 關掉後 app 還在？** 關閉視窗只會把 app 收到 Dock，同步和提醒照常跑；要真的離開按 `⌘Q`。

**不想看到別的團隊的 PR？** 在 **設定 → 工作區** 建一個 Space，只放你的 repo / org / Jira 專案，首頁上方切過去；舊團隊的資料可以加進永久忽略。

**Intel Mac 可以用嗎？** 目前不行，只有 Apple Silicon 版。

**問題回報**：到這個 repo 開 [Issue](https://github.com/needleapdo0610/homebrew-tap/issues)。

---

## English

**abouteverything** is a local-first work journal and AI secretary for engineers on Apple Silicon Macs. It watches your git repos, GitHub PRs, and Jira tickets, keeps quick notes (`⌘⇧Space` from anywhere), writes your daily standup, turns a quarter of work into a report your manager can read, and can hand coding tasks to Claude Code or Codex in an isolated git worktree. Nothing is pushed until you approve it.

It can use your existing **Claude or ChatGPT subscription** through the Claude Code / Codex CLIs (no API key), or any OpenAI-compatible endpoint. All data stays on your Mac (SQLite + macOS Keychain); source code and diffs are never copied.

```sh
brew install --cask needleapdo0610/tap/abouteverything
```

- **First launch:** a setup guide checks your tools (git, Claude Code / Codex CLI, GitHub CLI) and explains every macOS permission prompt. Connect GitHub, Jira, Outline and Microsoft 365 under Settings → Connectors; group your repos and projects into Spaces under Settings → Workspace.
- **Blocked by macOS?** The app is not notarized yet. Open **System Settings → Privacy & Security** and click **Open Anyway**.
- **Updates:** a badge appears at the bottom of the sidebar; or **Settings → 關於與更新 → 檢查更新**. Updates are signed and verified.
- **Uninstall:** `brew uninstall --cask abouteverything` keeps your data; add `--zap` to delete it.

The UI is available in Traditional Chinese and English (Settings → Appearance). Everything before v1.0.0 is a beta.
