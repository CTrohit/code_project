#   Median Running of Stream
#! user/bin/ruby
class Median
  
  def mad_val  
    arr=[]

    loop do
        num=gets.chomp
      if num=="exit"
          break
      end
      arr.append(num.to_i)
      arr_len=arr.length 
      arr=arr.sort!
      print arr
      if arr_len%2 == 0 
          a=arr[(arr_len/2)-1]+arr[(arr_len/2)]
          if a%2!=0
             a=(a.to_f/2)
             puts a
          else
            puts a/2 
          end
      else
          arr_len=arr.length 
          if arr_len == 1 
            puts arr[0]
          else
              a=arr_len/2
              a=a.to_i
              puts arr[a]
          end
      end
    end 
  end
end

puts "Enter Number and for Exit Enter => exit "
p=Median.new
p.mad_val
