#compulsory to solve
#case 1:Context = 'enter characters as displayed in image'
        #text = “12345”
        #output=12345
#case 3:-context = 'evaluate the expression',
       #text = ‘12 +2 =’   ['+','-','*','/','%']
       #output=4 
       
#case 2:- contex = ‘enter the fourth number’
          #text=’12345’  [‘first’, ‘second’, ‘third’, ‘fourth’, ‘fifth’]
          #output=4


#! user/bin/ruby
class  Pattern_main
  def char_disp
      begin
        puts "Enter Context =>"
        context=gets.chomp
        puts "Enter Text =>"
        text=gets.chomp.split.join
        
        if not (context.nil? or text.nil? or text =~ /\S/ or context =~ /\S/ ) then
          puts 10/0 
        end
        if context == "enter characters as displayed in image"
          puts text
        
        elsif context == "evaluate the expression"
          arr=['-', '+', '*', '%', '/']
          for i in (0..arr.length-1)
            if text.include? arr[i]
               eq=text.index('=')
               mad=text.index(arr[i])
               puts "#{text[0..mad-1].to_i.send( text[mad], text[mad+1..eq-1].to_i)}"
               break
            end
          end
        
        else
          arr=['first', 'second', 'third', 'fourth', 'fifth']
          cut=0
          for i in (0..arr.length-1)
            if context.include? arr[i]
              puts "#{text[i]}"
              break
         
            end 
            cut+=1
          end
          if cut==5
            puts 10/0
          end
             
          
        end
      rescue ZeroDivisionError
        puts "Invalid Input ! "
      #retry
          #puts " Enter Input:-"
      end  
    end
end    

p=Pattern_main.new 
p.char_disp
   
