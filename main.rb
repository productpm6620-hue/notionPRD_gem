require 'notion-ruby-client'

# 從雲端環境變數讀取 Token，保護隱私
client = Notion::Client.new(token: ENV['NOTION_TOKEN'])
db_id = '35f1255b6a7880229827fb18f0241dab'

begin
  db = client.database(database_id: db_id)
  puts "成功連線至：#{db.title[0].plain_text}"
  
  # 抓取前 5 筆 PRD 內容作為 AI 的素材
  response = client.database_query(database_id: db_id, page_size: 5)
  
  puts "\n--- 準備交給 Gemini 的 PRD 素材 ---"
  response.results.each do |page|
    name = page.properties['名稱']&.title&.first&.plain_text || "未命名"
    status = page.properties['狀態']&.select&.name || "無狀態"
    puts "需求: #{name} | 目前狀態: #{status}"
  end
rescue => e
  puts "錯誤：#{e.message}"
end
