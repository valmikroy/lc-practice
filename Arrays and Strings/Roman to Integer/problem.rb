#!/usr/bin/env ruby

=begin

Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9. 
X can be placed before L (50) and C (100) to make 40 and 90. 
C can be placed before D (500) and M (1000) to make 400 and 900.
Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

Example 1:
Input: "III"
Output: 3

Example 2:
Input: "IV"
Output: 4


Example 3:
Input: "IX"
Output: 9

Example 4:
Input: "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.

Example 5:
Input: "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.


=end


=begin

Commentry 

# 12:33

# create a lookup tabel with all possible value symbols single or double digit
# go char by char, keep manual track of index so you can do lookup ahead
# in lookup ahead if entry is mappable in the table values then advance index by 2 instead of 1 
# keep adding the looked up values to form a number

# 1:02


Time complexity is O(1) because roman numerals exists only till 3999



=end




table = {

	'I' => 1,
	'V' => 5,
	'X' => 10,
	'L' => 50,
	'C' => 100,
	'D' => 500,
	'M' => 1000,
	'IV' => 4,
	'IX' => 9,
	'XL' => 40,
	'XC' => 90,
	'CD' => 400,
	'CM' => 900

}


#str = 'III'.split(//)
#str = 'CD'.split(//)
#str = 'LVIII'.split(//)
#str = 'MCMXCIV'.split(//)
str = 'IX'.split(//)

num = 0
idx = 0


loop do
	cur_char = str[idx]
	nxt_char = str[idx + 1]

	fused_char = cur_char + nxt_char unless nxt_char.nil?

	unless table[fused_char].nil?
		num = num + table[fused_char]
		idx = idx + 2
	else
		num = num + table[cur_char]
		idx = idx + 1
	end

	
	break if idx == str.length
end


puts num
