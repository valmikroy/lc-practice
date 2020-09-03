#!/usr/bin/env ruby
#

=begin

Given an array nums of n integers, are there elements a, b, c in nums such that
a + b + c = 0? Find all unique triplets in the array which gives the sum of
zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]

=end


=begin
Commentory

1:21

- three different iterations so three different loops
- how to avoid 3 loops? 
- we know that we need 0 as answer - so if pick one element then we have find two more numbers which nullifies it to zero,
- these are integers and we can find max integer in this 
- so you take one number 

1:32 DO NOT TRY TO WRITE PERFECT SOLUTIOn

0 = a + b + c then 

-a =  b + c

take one element from the array , negate it

now that is a target and reduce array without that element 

now target - 2nd element = remainder 

look up remainder in the remaining array 


1:56 aborted timer - need to learn something deeper on techniques


- for element uniqness in the array - always sort and store 
- If you use delete by value functionality like `new_set = set - [ i ]` then it
  will delete duplicate values which is not desirable.


2:49 END

things I learned
- sort and store for uniqeness finding of an array 
- need to be careful while removing elements of any array 

=end


set = [-1, 0, 1, 2, -1, -4]

triplets = []

start_idx = 0

set.each_with_index do |i, idx1|
  target = i * -1
  new_set = set.dup
  new_set.delete_at(idx1)
  new_set.each_with_index do |j,idx2|
    
    remainder = target - j

    new_new_set = new_set.dup
    new_new_set.delete_at(idx2) 

    if new_new_set.include?(remainder)
      s = [i,j,remainder].sort
      triplets.push(s) unless triplets.include?(s)
    end 

  end  
end  


p triplets
