require 'nokogiri'
require 'open-uri'
require 'fileutils'
BASE_URL = "https://news.ycombinator.com/"
LOCAL_DIR = 'ycombinator-data'

FileUtils.makedirs(LOCAL_DIR) unless File.exists?(LOCAL_DIR)

page = Nokogiri::HTML(open(BASE_URL))
hrefs = page.css('.subtext a').map { |link| link['href'] }
hrefs.select! { |link| link.match(/item\?.*/) }

hrefs.each do |id| 
	comment_section = Nokogiri::HTML(open("#{BASE_URL}#{id}"))
	main_info = comment_section.at_css('.title a')
	header    =  main_info.text.gsub(/\s+/, "_")
	link      =  main_info['href']
	num       =  id.gsub(/\D/, "")
	dir       =  "#{LOCAL_DIR}/#{header}_#{num}"
	unless File.exists?(dir)

		FileUtils.makedirs(dir)

	  File.open("#{dir}/#{id}_comments.html", 'w') do |f|
	  	puts "Downloading comments..."
	  	begin
		    f.write(open("#{BASE_URL}#{id}").read)
		  rescue RuntimeError => e
		  	puts e
		  end
	  end
    
    unless link == id
    	if link[-3..-1] == "pdf"
    		File.open("#{dir}/#{id}_link.pdf", 'w') do |f|
    			puts "Downloading link..."
    			begin
    				f.write(open(link).read)
    			rescue RuntimeError => e
    				puts e
    			end
    			puts "Switching directories..."
    			sleep 2
    		end

    	else
	      File.open("#{dir}/#{id}_link.html", 'w') do |f|
	   	    puts "Downloading link..."
	  	      begin
	  	        f.write(open(link).read)
	  	      rescue RuntimeError => e
	  		      puts e
	  	      end
	        puts "Switching directories..."
	        sleep 2
	      end
      end
    end
  end
end

