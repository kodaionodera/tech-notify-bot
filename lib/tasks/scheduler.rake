require 'nokogiri'
require 'open-uri'

desc "This task is called by the Heroku scheduler add-on"

task :test_scheduler => :environment do
  puts "scheduler test"
  puts "it works."
end

task scrape: :environment do
  url = ENV['URI']

  charset = nil

  html = open(url) do |f|
      # utf-8 文字種別を取得
      charset = f.charset
      # fileクラスのオブジェクトを読み込む
      f.read
  end

  # htmlをパース(解析)してオブジェクトを作成
  doc = Nokogiri::HTML.parse(html, nil, charset)

  # サイドバーの新着を取得
  value = doc.xpath('//div[@class="list list-sidebar-article"]').css('a').attribute('href').value

  # 最新画像を取得
  doc.xpath('//div[@class="sidebar-article-thumb"]').each_with_index do |node, num|
    next unless num.zero?
    @image_url = node.css('div').attribute('style').value
  end

  @image_url.chop!.slice!(0, 22)
  # FIXME 強引に合わせているのでheroku側の修正をする
  today = Time.zone.now.yesterday.to_date.to_s.gsub('-', '_')

  # デバッグ用
  # ---------------------
  pp value
  pp @image_url
  pp Time.zone.now
  pp today
  # ---------------------

  notify_slack(value) if value.include?(today)
end

def notify_slack(value)
  uri = URI.parse(ENV['WEB_HOOKS_URI'])
  payload = {
    channel: "#tech_rachoニュース",
    username: "通知bot",
    icon_emoji: ":ghost:",
    attachments: [{
      fields: [
          {
              "title": "新着記事が更新されました。",
              "value": value,
          }],
      image_url: @image_url
    }]
  }

  Net::HTTP.post_form(uri, { payload: payload.to_json })
end
