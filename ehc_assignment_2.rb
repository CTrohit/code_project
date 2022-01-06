#! usre/bin/ruby
require "net/http"
require "uri"
require 'logger'
class EhcAssignment
  log= Logger.new('./log_error','daily')
  log.level = Logger::WARN
  def crawl(date)
    begin
      reise TypeError 'Invail formate' if date == '%d-%m-%y'
      url = "https://services.ecourts.gov.in/ecourtindiaHC/cases/highcourt_causelist_qry.php"
      request= Net::HTTP.post_form(URI(url),{"action_code" => "pulishedCauselist", "causelist_dt" => date,"state_code" => "1","dist_code" => "1","court_code" => "2"})
      case request
      when Net::HTTPSuccess then
        file=File.open("./result.html","w")
        file.write(request.body)
        file.close()
        puts "File Save Path:-#{File.expand_path('../result.html',__FILE__)}"
        response=request.body
        puts "Parsing Result:-"
        puts parse(response.gsub(/\s+/," ").strip)
      end
    rescue Exception =>e
      puts e.massage
      puts e.backtrace.inspect
      log.error(e)  
    end
  end
  def parse(response)
    begin
      response_array=response.split("^#")
      parse_array=[]
      for num in (0..response_array.length()-1)
        raise IndexError, 'Indexing Error Empty' if (response_array[num].nil?)
        response_array_element = response_array[num].split("~") 
        parse_array[num]={'serial_number':num+1,
                          'bench':response_array_element[1],
                          'cause_list':response_array_element[2].gsub(/\s+/," ").strip,
                          'link':"https://services.ecourts.gov.in/ecourtindiaHC/cases/display_causelist.php?filename="+response_array_element[4]}
      end
    rescue Exception => e
      puts e.massage
      puts e.backtrace.inspect
      log.error(e)
    end
    return parse_array
  end
end
puts "Enter a Date:DD-MM-YYYY"
date=gets.chomp
main=EhcAssignment.new
main.crawl(date)




