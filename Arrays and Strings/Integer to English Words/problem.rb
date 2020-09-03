#usr/bin/env ruby
#

=begin
https://leetcode.com/problems/integer-to-english-words/

Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 2^31 - 1.

Example 1:
Input: 123
Output: "One Hundred Twenty Three"

Example 2:
Input: 12345
Output: "Twelve Thousand Three Hundred Forty Five"

Example 3:
Input: 1234567
Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"

Example 4:
Input: 1234567891
Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"

=end

=begin

1:05

lookup table matching numbers to words 

max is 4 billion value 
divide number in chunk of less than 1000

then each chunk of thousand naming convert with hundreds and number 

divide in 3 chucks
- billion
- million  if > 0 then attach million 
- thousands  if > 0 then attach thousand
- last hundreads

convert each chunk into hundreads 


function for naming hundreads 
take out left most number and attach hundread to it  if > 0
take two rght most numbers and convert them if they are >0


1-19 
20
30
40
50
60
70
80
90 


I will keep implementation aside
=end


num_to_name = {


  "1" => "One",
  "2" => "Two",
  "3" => "Three",
  "4" => "Four",
  "5" => "Five",
  "6" => "Six",
  "7" => "Seven",
  "8" => "Eight",
  "9" => "Nine",
  "10" => "Ten",

  


}



