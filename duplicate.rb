#Count Frequency of Elements
# user/bin/ruby
class Duplicate
  def initialize(n)
    @n = n
  end
   
  def du_num
    arr=[]
    c=0
    for i in (0..@n.length-1)
      arr[i]=@n[i]
    end
    puts "Number   occurence"
    arr1=arr.uniq
    for i in arr1
      count=arr.count(i) 
      puts "#{i}           #{count}"
    
    end
  end
end
n=gets.chomp
p=Duplicate.new(n)
p.du_num




