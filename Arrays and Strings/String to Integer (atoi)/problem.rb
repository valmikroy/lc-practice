#!/usr/bin/env ruby

=begin
Implement atoi which converts a string to an integer.

The function first discards as many whitespace characters as necessary until
the first non-whitespace character is found. Then, starting from this
character, takes an optional initial plus or minus sign followed by as many
numerical digits as possible, and interprets them as a numerical value.

The string can contain additional characters after those that form the integral
number, which are ignored and have no effect on the behavior of this function.

If the first sequence of non-whitespace characters in str is not a valid
integral number, or if no such sequence exists because either str is empty or
it contains only whitespace characters, no conversion is performed.

If no valid conversion could be performed, a zero value is returned.

Note:

Only the space character ' ' is considered as whitespace character.  Assume we
are dealing with an environment which could only store integers within the
32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of
the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is
returned.

Example 1:

Input: "42"
Output: 42


Example 2:
Input: "   -42"
Output: -42
Explanation: The first non-whitespace character is '-', which is the minus sign.
             Then take as many numerical digits as possible, which gets 42.


Example 3:
Input: "4193 with words"
Output: 4193
Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.


Example 4:
Input: "words and 987"
Output: 0
Explanation: The first non-whitespace character is 'w', which is not a numerical 
             digit or a +/- sign. Therefore no valid conversion could be performed.


Example 5:
Input: "-91283472332"
Output: -2147483648
Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
             Thefore INT_MIN (−231) is returned.

=end



=begin
Commentary 

10:22

- split string by chars
- put digits on the stack of the array 
- unwind stack with multiplying 10
- multipley with -1 if it has negative sign


- first solve this for simple case 
- then add check for the sign
- add check for the begining of the string to be a digit


10:56



This can be optimized for space complexity using recurision 


This problem can be solved differently without needing a array stack storage

11:27 optimized solution

=end



str = '     -42'
#str = '4193 with words'
#str = 'words and 987'
#str = '-91283472332'

stack = []
num = 0

prev = ''

raise "Invalid input" unless str.match(/^\d/) || str.match(/^-/) ||  str.match(' ')

str.split(//).each do |c|
	if c.match(/\d/)
		stack.unshift(prev) if prev.match(/-/)
		stack.unshift(c.to_i) 
	end
	prev = c
end

stack.each_with_index do |n,i|
	if n == '-'
		num = num * -1 
	else
		num = num + n * 10 ** i
	end
end


puts num


puts "2nd approach"
num=0
is_negative = false


str.split(//).each do |c|

	if c.match(/\d/)
		if prev.match(/-/)
			is_negative = true
		end

		if num == 0
			num = c.to_i 
		else
			num = num * 10 + c.to_i
		end
	end
	prev = c

end


num = num * -1 if is_negative

puts num




