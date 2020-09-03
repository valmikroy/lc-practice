#!/usr/bin/env ruby
#
=begin 

Given two binary strings, return their sum (also a binary string).

The input strings are both non-empty and contains only characters 1 or 0.

Example 1:

Input: a = "11", b = "1"
Output: "100"
Example 2:

Input: a = "1010", b = "1011"
Output: "10101"
 

Constraints:

Each string consists only of '0' or '1' characters.
1 <= a.length, b.length <= 10^4
Each string is either "0" or doesn't contain any leading zero.

=end


=begin
2:52
2:59 pause
3:03 started 
3:23 finished


Time complexity is O(max(N,M))



=end

a = "1010"
b = "1011"

length = 15

# padding is unecessary 
b1 = Array.new((15-a.split(//).length),0).push(a.split(//)).flatten
b2 = Array.new((15-b.split(//).length),0).push(b.split(//)).flatten


idx = length

carryover = 0
product = Array.new()
loop do
  idx -=  1

    d = b1[idx].to_i + b2[idx].to_i + carryover

    if d == 0 
      carryover = 0
      product.unshift(0)
    elsif d == 1
      carryover = 0
      product.unshift(1)
    elsif d == 2
      carryover = 1
      product.unshift(0)
    elsif d == 3
      carryover = 1
      product.unshift(1)
    end


  break if idx == 0
end


p product






