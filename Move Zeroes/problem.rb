#!/usr/bin/env ruby
#

=begin

https://leetcode.com/problems/move-zeroes/

Given an array nums, write a function to move all 0's to the end of it while
maintaining the relative order of the non-zero elements.

Example:

Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
Note:

You must do this in-place without making a copy of the array.
Minimize the total number of operations.

=end
=begin

5:01


5:18

=end


input = [0,1,0,3,12]

len = input.length

i=0

input.each_with_index do |n,idx| 

  if n == 0 
    j = idx
    loop do 
      j += 1
      if j == len
        input[j-1] = 0
        break
      end
      input[j-1] = input [j]
    end  
  end  

end

p input
