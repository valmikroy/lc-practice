# Array and Strings notes



- Array delete at 

  ```ruby
  a.delete_at(index) 
  ```

- Try to use `while` loop efficiently with condition.

- loop in loop like following has O(n^2) complexity 

  ```ruby
  idx
  while ( idx loop) do
  	j = idx
  	while( j loop) do
  		
  	end
  end
  ```

- Code snip Map

  ```ruby
  a = [1 , 2 ,3 ,4, 5]
  b = a.map{ |n| n**2 }        # stores squares of all number in b
  c = a.select{|n| n%2 == 0 }  # selects even numbers in c
  ```

- Redo

  ```ruby
  10.times do |i|
    puts "Iteration #{i}"
    redo if i > 2
  end
  ```

- Hash sort by key

  ```ruby
  metrics = {"sitea.com" => 745, "siteb.com" => 9, "sitec.com" => 10 }
  metrics.sort_by { |_k,v| v }.reverse.to_h.each { |k,v| puts v }
  ```

- Break out of all loops 

  ```ruby
  catch :break_out do
  
  	input.each_with_index do |e1,i|
  		input.each_with_index do |e2,j|
  			next if i == j
  			if e1+e2 == target	
  				output = [ i, j ]
  				p output
  				throw :break_out
  			end
  		end
  	end 
  
  end
  ```

- Padding in array 

  ```ruby
  b1 = Array.new((15-a.split(//).length),0).push(a.split(//)).flatten
  b2 = Array.new((15-b.split(//).length),0).push(b.split(//)).flatten
  ```

  

