# notionPRD_gem
## 1. 目前的 GitHub Ruby 流程與使用情境

目前的流程重點在於 **「打破公司電腦限制，實現數據結構化」**。

### **技術流程圖**

- **雲端環境 (GitHub Codespaces)**：
    - 利用 GitHub 的虛擬機避開公司電腦無法安裝 Ruby 的權限限制。
    - 透過 `Gemfile` 定義 `notion-ruby-client` 套件，讓 Ruby 具備與 Notion 通訊的能力。
- **安全認證 (Security)**：
    - 透過 `export` 指令將 Token 存放在環境變數，確保程式碼儲存在 GitHub 時不會外洩金鑰。
- **讀取與解析 (Fetch & Parse)**：
    - 使用 `Retrieve Page API` 定位到你的 **PRD標準模板**。
    - 使用 `Retrieve Block Children API` 遍歷文件中的每一塊「積木」（標題、段落、清單），將其轉化為 AI 可讀的純文字流。

### **詳細使用情境**

- **標準化管理**：不論你的 PRD 模板多長，只要你在 Notion 裡修改了模板結構（例如新增了「API List」章節），GitHub 上的程式碼一跑就能立刻同步最新的格式。
- **知識庫準備**：將原本只能「看」的 Notion 頁面，變成程式可以「讀」的結構化數據，為餵給 AI 做準備。

2. 下一步規劃：AI 自動化生成 PRD
接下來的功能目標是 「輸入需求標題，輸出符合規範的 PRD 草稿」。這將大幅加速你在 Pocket DCA 2.0 升級專案中的產出效率。

技術規劃流程
整合 Gemini AI：

在 GitHub 環境中接上 Gemini 1.5 Flash 模型。

將「讀取到的 Notion 模板內容」加上「你的新功能構想」組合成一個高質量的 Prompt。

智慧填充 (Smart Filling)：

AI 會模仿你的 PRD 寫作風格，針對每個章節（如 Trigger、商業邏輯、Edge Case）自動撰寫內容。

自動寫回 Notion (Automated Writing)：

程式執行完後，不再只是把文字印在黑窗視窗裡，而是調用 create_page 指令，在 Notion 指定位置自動建立一個新頁面。

詳細使用情境 (以 Pocket DCA 2.0 為例)
情境 A：快速原型規格化

你在會議中想到一個「DCA 歷史回測圖表」的點子。

你在 Terminal 執行 ruby main.rb。

結果：30 秒後，Notion 裡已經出現了一份依照「PRD標準模板」格式寫好、內容包含 Input/Output 邏輯、甚至考慮到數據回測 Edge Case 的初稿。

情境 B：數據驅動的追蹤埋點建議

你輸入新功能時，AI 會根據你之前的 GA4 追蹤經驗，自動在「Tracking / Data」章節建議應埋設的 Event 點位。

情境 C：專業一致性檢查

確保所有 PM（或你自己）在規劃 Pocket Securities 產品時，都不會漏掉「錯誤處理 (Error Handling)」或「文案規範」等關鍵章節，因為 AI 嚴格執行了模板。

