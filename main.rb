require 'notion-ruby-client'

puts "目前的 Token 長度是: #{ENV['NOTION_TOKEN']&.length || '空值'}"
# 1. 初始化 Client
client = Notion::Client.new(token: ENV['NOTION_TOKEN'])

# 2. 你的頁面 ID (確認不帶連字號)
page_id = '35f1255b6a7880229827fb18f0241dab'

begin
  # 第一步：獲取頁面標題
  page_info = client.page(page_id: page_id)
  # 注意：頁面標題的提取路徑與資料庫不同
  title = page_info.properties['title']&.title&.first&.plain_text || "未命名頁面代碼"
  puts "✅ 已成功讀取文件：#{title}"
  puts "="*30

  # 第二步：抓取頁面內的「所有積木內容」
  # block_children 會回傳頁面內所有的段落、標題、清單等
  blocks = client.block_children(block_id: page_id)

  full_content = ""
  puts "--- 文件內容摘要 ---"
  
  blocks.results.each do |block|
    case block.type
    when 'paragraph'
      text = block.paragraph.rich_text.map(&:plain_text).join
      full_content += "#{text}\n" if text.any?
      puts "[段落] #{text}" if text != ""
    when 'heading_1', 'heading_2', 'heading_3'
      level = block.type.split('_').last
      text = block.send(block.type).rich_text.map(&:plain_text).join
      full_content += "#" * level.to_i + " #{text}\n"
      puts "[標題#{level}] #{text}"
    when 'bulleted_list_item'
      text = block.bulleted_list_item.rich_text.map(&:plain_text).join
      full_content += "- #{text}\n"
      puts "[列表] #{text}"
    end
  end

  # 如果你想把整份內容存起來交給 AI
  if full_content.empty?
    puts "⚠️ 警告：讀取到了頁面，但沒有發現可讀取的文字塊。請確認頁面內是否有輸入內容。"
  end

rescue => e
  puts "❌ 讀取失敗：#{e.message}"
end
