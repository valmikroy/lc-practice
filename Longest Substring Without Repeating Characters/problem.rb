#!/usr/bin/env ruby

=begin
Given a string, find the length of the longest substring without repeating characters.

Example 1:

Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3. 
Example 2:

Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 
             Note that the answer must be a substring, "pwke" is a subsequence and and not a substring.
=end


=begin

Commentry 

- read string char by char 
- keep a track of occurance of the char
- on the occurance of the char you note down string 
- reset char occurance counters and repeat the exercise until you reach to the end of the string

# 17 minutes - first road block

- while repeating, make sure you consider the char which cause the reset for next iteration


# finished in 30 minutes

# Took a while to understand big O notation calculation.

=end

require 'pp'


str = 'abcabcbb'
#str = 'bbbbb'
#str = 'pwwkew'

map = Array.new()

uniq_strs = Hash.new()


str.split(//).each do |c|
	if map.include?(c)	
		s = map.join('')
		uniq_strs[s.to_sym] = map.length
		map = Array.new()
	end
	map.push(c)
end


pp uniq_strs.sort_by { |s, l| l }.pop



