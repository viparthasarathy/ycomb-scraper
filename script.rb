require 'nokogiri'
require 'open-uri'
require 'fileutils'
BASE_URL = "https://news.ycombinator.com/"
LOCAL_DIR = 'ycombinator-data/pages'

FileUtils.makedirs(LOCAL_DIR) unless File.exists?(LOCAL_DIR)

page = Nokogiri::HTML(open(BASE_URL))
hrefs = page.css('.subtext a').map { |link| link['href'] }
hrefs.select! { |link| link.match(/item\?.*/) }

hrefs.each do |link| 
	unless File.exists?("#{LOCAL_DIR}/#{link}.html")
	  File.open("#{LOCAL_DIR}/#{link}.html", 'w') do |f|
		  f.write(open("#{BASE_URL}#{link}").read)
	  end
  end
end
