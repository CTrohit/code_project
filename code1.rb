#! user/bin/ruby


require 'net/http'
require 'json'

link = "https://www.ruby-lang.org/"

links = URI.parse(link)
response = Net::HTTP.get_response(links)
puts response.body
begin
  file = File.open("/home/user1/Downloads/data.txt","w")
  file.write(response.body)
rescue IOError => e 
  puts e
ensure
  file.close unless file.nil?
end

