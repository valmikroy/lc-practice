#!/usr/bin/env ruby
#

=begin 
https://leetcode.com/problems/product-of-array-except-self/

Given an array nums of n integers where n > 1,  return an array output such
that output[i] is equal to the product of all the elements of nums except
nums[i].

Example:
Input:  [1,2,3,4]
Output: [24,12,8,6]

Constraint: It's guaranteed that the product of the elements of any prefix or
suffix of the array (including the whole array) fits in a 32 bit integer.

Note: Please solve it without division and in O(n).

Follow up:
Could you solve it with constant space complexity? (The output array does not
count as extra space for the purpose of space complexity analysis.)
=end



=begin 

12:20

i=0 > i-1 > i > i+1 > i = n-1


O[i] = L[i-1 to 0] * G[i+1 to n-1] 

lesser 
decrement i by 1
if i < 0 

greater
increment i by 1
if i > n -1


12:42 




=end




i = 0 

#input = [1,2,3,4]
input = [4,5,1,8,2]
output = []

len = input.length

loop do 

  LP = 1
  Lidx=i
  loop do 
    Lidx -= 1
    if Lidx >= 0
      LP = input[Lidx] * LP
    else
      break
    end  
  end  

  GP = 1
  Gidx=i
  loop do 
    Gidx += 1
    if Gidx <= len-1
      GP = input[Gidx] * GP
    else
      break
    end  
  end  

  
  output[i] = GP * LP  

  i += 1
  break if i == len 
end   

p output
