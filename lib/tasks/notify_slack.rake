require 'nokogiri'
require 'open-uri'

task scrape: :environment do
  url = 'https://techracho.bpsinc.jp/'

  charset = nil

  html = open(url) do |f|
      # utf-8 文字種別を取得
      charset = f.charset
      # fileクラスのオブジェクトを読み込む
      f.read
  end

  # htmlをパース(解析)してオブジェクトを作成
  doc = Nokogiri::HTML.parse(html, nil, charset)

  # サイドバーの新着一覧
  doc.xpath('//div[@class="list list-sidebar-article"]').each do |node|
    # 記事
    @value = node.css('a').attribute('href').value
  end

  # デバッグ用
  # ---------------------
  # pp @value
  # pp today = Time.zone.now.to_date.to_s.gsub('-', '_')
  # ---------------------

  if @value.include?("2020_03_06")
    notify_slack
  end
end

def notify_slack
  uri = URI.parse('https://hooks.slack.com/services/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')
  payload = {
    channel: "#tech_rachoニュース",
    username: "通知bot",
    icon_emoji: ":ghost:",
    attachments: [{
      fields: [
          {
              "title": "TechRachoの新着記事が更新されました。",
              "value": @value,
          }],
      image_url: "https://techracho.bpsinc.jp/wp-content/uploads/2020/02/rails6_docker_configs_eyecatch-min.png"
    }]
  }

  Net::HTTP.post_form(uri, { payload: payload.to_json })
end
