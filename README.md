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
