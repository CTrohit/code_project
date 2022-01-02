#! usre/bin/ruby
require "net/http"
require "uri"

class EhcAssignment 
  def parse(response)
    response_array=response.split("^#")
    parse_array=[]
    for num in (0..response_array.length()-1)
        response_array_element = response_array[num].split("~") 
        parse_array[num]={'serial_number':num+1,
'bench':response_array_element[1],'cause_list':response_array_element[2],'link':"https://services.ecourts.gov.in/ecourtindiaHC/cases/display_causelist.php?filename="+response_array_element[4]}
    end
    return parse_array
  end
  def crawl(url,date)
    raise ArgumentError, 'too many HTTP redirects' if (url.nil? or date.nil?)
    request = Net::HTTP.post_form(URI.parse(url),{"action_code" => "pulishedCauselist", "causelist_dt" => date,"state_code" => "1","dist_code" => "1","court_code" => "2"})
    case request
    when Net::HTTPSuccess then
      file=File.open("./result.html","w")
      file.write(request.body)
      response=request.body.gsub(/\s+/," ").strip
      puts parse(response)  
    else
      request.value
    end
  end
end
uri = "https://services.ecourts.gov.in/ecourtindiaHC/cases/highcourt_causelist_qry.php"
puts "Enter a Date:DD-MM-YYYY"
date=gets.chomp
main=EhcAssignment.new
main.crawl(uri,date)




