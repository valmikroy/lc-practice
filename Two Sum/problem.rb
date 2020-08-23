#!/usr/bin/env ruby

=begin

Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].


=end


=begin
Commentery

8:49

- two indexes i and j 
- while i stay constatnt, j moves through rest of the elements
- input is exactly single solution, you can quit after you find the match

9:05


This is n^2 run time complexity due to two loops


You can improve runtime complexity by doing subtraction from the target



=end

require 'pp'


input = [2, 7, 11, 15]
target = 9

output = Array.new

puts "O - n^2"

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

puts "O - n"
input.each_with_index do |e1,i|
	complement = target - e1
	if input.include?(complement)
		output = [i , input.index(complement) ]
		p output
		exit
	end
end 



