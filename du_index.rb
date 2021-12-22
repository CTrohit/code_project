

#! user/bin/ruby
class Index
  def initialize(n)
    @n = n
  end
   
  def du_index
    arr=[]
    c=0
    for i in (0..@n-1)
      arr[i]=gets.to_i 
    end
    count=0
    for m in (1..@n)

      for i in (m..@n-1)
    
        if arr[m-1]==arr[i]
            count+=1
        
        
       
        if count==1 and c==0 
            e_index=m-1
            c+=1
            puts "#{e_index} index"
      
        end
        end
      end
    end
  end
end
n=gets.to_i
p=Index.new(n)
p.du_index
