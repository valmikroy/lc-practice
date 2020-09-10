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

- Regex matching ruby 

  ```ruby
  c.match(/[a-z0-9]/
  ```

- Spaceship 

  ```ruby
  case a <=> b
  when -1
    "a < b"
  when 0
    "a == b "
  when 1
    "a > b"
  else
    "Unknown"
  end  
  
  ```

  





### Linked List



| Data Structure | Access | Search | Insertion | Deletion |
| -------------- | ------ | ------ | --------- | -------- |
| Array          | O(1)   | O(n)   | O(n)      | O(n)     |
| Linked List    | O(n)   | O(n)   | O(1)      | O(1)     |



The time required to remove the item from the linked list depends on how exactly we a going to do this. Here are possibilities:

- Remove by value. In this case we need to find an item (*O(n)*) and remove it (*O(1)*). The total time is *O(n)*.
- Remove by index. In this case we need to traverse list (*O(index)*) and remove item (*O(1)*). The total time is *O(index)*. For arbitrary index it is *O(n)*.
- Remove by the reference to the linked list node that contains the item *O(1)*.





### Recursion

- If recursive function - always think in terms of its inputs and what output you are getting.
- recursive function with no output is much easier to implement.
- If recursive function is returning an output then you have to accomodate the procesing of that output.



### Tips

- look at input and output carefully while reading the problem.
- Do not forget to calculate time and space complexity 
- Make sure you attach a `!` to some of the string manipulation functions
- Write down logic in systematic format in the comment  section  
-  we have to careful about carryover , if no carry over in current cycle then do not forget to reset it. carry over in the last addition has to be considred

### Exercise 

- matrices multiplication
- regular integer multiplication 
- Log(n) in O notation - how this happens
- figure out mathematical notation to represent range of the array 
- work on set [theory using array](https://medium.com/amiralles/mastering-data-structures-in-ruby-sets-5d674169cd2d) 

