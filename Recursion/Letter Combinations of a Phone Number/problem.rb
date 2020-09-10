#!/usr/bin/env ruby
#

=begin
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

Input: "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
=end






def comb(nums=[])
  letters = {
    "1" => [],
    "2" => %w( a b c ),
    "3" => %w( d e f ),
    "4" => %w( g h i ),
    "5" => %w( j k l ),
    "6" => %w( m n o ),
    "7" => %w( p q r s ),
    "8" => %w( t u v ),
    "9" => %w( w x y z ),
    "0" => []
  }

  n = nums.shift

  if nums.length == 0 
    return letters[n.to_s]
  else
    seq = comb(nums)

    out = []

    letters[n.to_s].each do |l|
      seq.each do  |s|
        out.push(s + l)
      end
    end
    return out
  end  

end


p comb([2, 3, 4, 5])
