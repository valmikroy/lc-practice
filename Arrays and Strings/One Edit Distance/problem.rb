#!/usr/bin/env ruby
#

=begin
https://leetcode.com/problems/one-edit-distance/solution/


Given two strings s and t, return true if they are both one edit distance apart, otherwise return false.

A string s is said to be one distance apart from string t if you can:

Insert exactky one character into s to get t.
Delete exactly one character from s to get t.
Replace exactly one character of s with a different character to get t.
 

Example 1:

Input: s = "ab", t = "acb"
Output: true
Explanation: We can insert 'c' into s to get t.
Example 2:

Input: s = "", t = ""
Output: false
Explanation: We cannot get t from s by only one step.
Example 3:

Input: s = "a", t = ""
Output: true
Example 4:

Input: s = "", t = "A"
Output: true
 

Constraints:

0 <= s.length <= 104
0 <= t.length <= 104
s and t consist of lower-case letters, upper-case letters and/or digits..

=end

=begin
4:36

str legth equal or 1 char apart 

idx 0 to  leagth -1 
if equal then traverse through string  using idx pointer
find a mismatch position
continue traversing 
if reached to the end 


idx 0 to length of longest - 1
take short str in a 
take long str in b
flag = 0
a[idx+flag] == b[idx]
idx++

flag = 1
a[idx-flag] != b[idx] 
if eached to the end then 

O(n)

I have make strings in order
=end


#s = "ab".split(//)
#t = "acb".split(//)

#s = "".split(//)
#t = "".split(//)
#

s = ""
t = "A"

diff = s.length - t.length


if s.length + t.length == 0
  puts "-NOT a one edit away"
elsif diff == 0

  idx = 0
  mismatch = false
  loop do
    if s[idx] != t[idx]
      if mismatch
        puts "NOT a one edit away"
        break
      else
        mismatch = true 
      end

      idx += 1
      if idx == s.length
        mismatch ? (  puts "One edit away" )  : ( puts "NOT a one edit away - both strings are equal" )
        break
      end  
    end  
  end  
elsif diff.abs == 1
  s.length > t.length ?  l = s.length : l = t.length

  idx = 0
  mismatch = false
  offset = 0
  loop do 
    if s[idx+offset] != t[idx]
      if mismatch
        puts "NOT a one edit away"
        break
      else
        mismatch = true
        offset = 1
      end  
    end  

      idx += 1
      if idx == l
        mismatch ? (  puts "One edit away" )  : ( puts "NOT a one edit away - both strings are equal" )
        break
      end  
  end  
else
  puts "-NOT a one edit away"
end  







