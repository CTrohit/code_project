#Staircase Problem
#! user/bin/ruby

class Staircase
 
  def step(n)
    if n == 0
      return 1
    elsif n < 0
      return 0
    else
      return  ( step( n - 3 ) + step( n - 2 ) + step( n - 1 ) )
    end
  end
end
puts "Enter step:"
n=gets.to_i
puts "Number of Ways:"
p=Staircase.new
puts p.step(n)
