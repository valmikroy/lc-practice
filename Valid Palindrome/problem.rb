#!/usr/bin/ruby
#

=begin
https://leetcode.com/problems/valid-palindrome/solution/


Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Note: For the purpose of this problem, we define empty string as valid palindrome.

Example 1:

Input: "A man, a plan, a canal: Panama"
Output: true

Example 2:
Input: "race a car"
Output: false


Constraints:

s consists only of printable ASCII characters.


=end

=begin

3:56

- make array of char 
- look for a range [A-Z,a-z,0-9]
- lower case each char
- reverse array and match it with original one

4:12

=end



def  is_palindrome(s)

  a = []
  s.split(//).each do |c|
    c.downcase! 
    a.push(c) if c.match(/[a-z0-9]/)
  end

  aa = a.join('')
  aar =  a.reverse.join('')
  if aa == aar
    return true
  end 
  return false
end

x = "A man, a plan, a canal: Panama"
puts "Plindrome" if is_palindrome(x)


