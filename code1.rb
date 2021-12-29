#! user/bin/ruby


require 'net/http'
require 'json'


def link(uri_str, limit = 10)
 
  raise ArgumentError, 'too many HTTP redirects' if limit == 0
  response = Net::HTTP.get_response(URI(uri_str))
  case response
  when Net::HTTPSuccess then
    file = File.open("/home/user1/Downloads/data.txt","w")
    file.write(response.body)
    puts response.body
    
  when Net::HTTPRedirection then
    location = response['location']
    warn "redirected to #{location}"
    link(location, limit - 1)
  
  else
    response.value
  end
end

print link('https://www.ruby-lang.org/')



