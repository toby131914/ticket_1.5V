# GitHub Pages 分享入口

本次已整理 `GitHub-Pages-upload` 資料夾。請將資料夾「裡面的內容」上傳至 `toby131914/ticket_test` 的 main 分支根目錄，覆蓋原本的 index.html。不要把 GitHub-Pages-upload 外層資料夾一起上傳。

部署後主頁： https://toby131914.github.io/ticket_test/

部署後教學頁： https://toby131914.github.io/ticket_test/extension_install.html

主頁最上方會顯示「安裝教學與擴充功能下載」按鈕。若尚未顯示，確認 main 分支根目錄的 index.html 已更新，等待此次 Pages 部署完成後按 Ctrl+Shift+R 重新整理。

## 上傳檔案

請保留相同的資料夾結構，上傳至 GitHub Pages 使用的根目錄：

```text
index.html
extension_install.html
.nojekyll
downloads/
  Google-Forms-Sniper-Extension.zip
```

ZIP 已包含 `manifest.json`、`background.js`、`popup.html`、`popup.js`。不要漏掉 downloads 資料夾。擴充功能原始碼與 `package-extension.ps1` 也可放在 repository，方便維護。`server.py` 不需要上傳，也不會在 GitHub Pages 執行。

## 啟用與分享

1. 在 repository 的 Settings → Pages 選擇 Deploy from a branch。
2. 選擇使用的分支與根目錄，儲存並等待部署完成。
3. 分享安裝入口：`https://你的帳號.github.io/你的repo/extension_install.html`。
4. 已安裝的使用者可以直接開啟 `https://你的帳號.github.io/你的repo/`。

朋友下載 ZIP、解壓縮、載入 Chrome 擴充功能，再貼上自己電腦的擴充 ID。點選「儲存並開啟搶票系統」會透過網址參數帶入 ID，控制頁再檢查連線。請勿把自己的擴充 ID 當成每位朋友共用的 ID。

## 更新下載包

修改擴充功能原始碼後，在此資料夾執行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\package-extension.ps1
```

將產生的新 ZIP 一起上傳 GitHub。朋友需下載新版並覆蓋原資料夾，再於 Chrome 擴充功能管理頁重新載入。網頁更新不會自動更新手動安裝的擴充功能。

## 網域與限制

目前擴充功能允許 GitHub Pages、localhost 與 127.0.0.1 呼叫。若使用自訂網域，需在 `manifest.json` 的 `externally_connectable.matches` 加入該網域，重新打包並讓使用者更新。

安裝頁使用相對連結，可部署在 repository 的子路徑。GitHub Pages 提供靜態網頁與下載檔案，朋友仍需在電腦版 Chrome 安裝擴充功能。
