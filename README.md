# Ruby programming tips



- Nested loop break is achieved through catch and throw

  ```ruby
  catch :break_out do
  
          input.each_with_index do |e1,i|
                  input.each_with_index do |e2,j|
  																/* do some work */
                                  throw :break_out
                          end
                  end
          end
  end
  ```

- Simple non index `loop` comes handy for manual array index management

  ```ruby
  a = [1,2,3,4]
  idx = 0
  loop do 
    puts a[idx]
    idx++
  end	
  ```

- hash sorted by value 

  ```ruby
  metrics = {"sitea.com" => 745, "siteb.com" => 9, "sitec.com" => 10 }
  metrics.sort_by {|_key, value| value}
    # ==> [["siteb.com", 9], ["sitec.com", 10], ["sitea.com", 745]]
  ```

  [Credit](https://stackoverflow.com/a/2540473)

- looping array with the index, remember that index is the second item

  ```ruby
  X.each_with_index do |item, index|
    puts "current_index: #{index}"
  end
  ```

- To define uniqness of the array, you should sort and compare.

- Delete element from an array 

  ```ruby
  # delete by value, NOTE this can delete duplicate values
  new_set = set - [i]
  
  
  # delete by index, it return deleted value and modifies the array 
  set.delete_at(i)
  ```

- zero initialized array which will grow as you push elements inside it.

  ```ruby
  Array.new(123, 0) 
  ```

- In ruby following does not work 

  ```ruby
  idx++ # does not work
  idx -= 1 	
  ```

- Splice of an array 

  ```ruby
  [1, 2, 3, 4, 5].splice(1, 3)
  // [2, 3, 4]
  ```

- Simple closure 

  ```ruby
  def form_close
  
    d = 100
  
    return lambda  do |c|
  
      d = d + c
  
    end
  
  end
  
  
  x = form_close
  
  puts x.call(1)
  puts x.call(1)
  puts x.call(1)
  ```

  



### Exercise 

- matrices multiplication
- regular integer multiplication 

