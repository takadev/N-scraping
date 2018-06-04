require 'nokogiri'
require 'open-uri'

url = 'http://www.ozmall.co.jp/travel/'

charset = nil

html = open(url) do |f|
    charset = f.charset
    f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.xpath('//div[@class="p__layout-table01a"]').each do |node|
  p node.css('a').inner_text
end
