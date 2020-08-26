#!/usr/bin/env ruby
#
=begin
Given an array of strings, group anagrams together.

Example:

Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note:

All inputs will be in lowercase.
The order of your output does not matter.
=end

=begin

2:10

main set

pick a first element of the set
push on the stack 
check for its anagram  (is an anagram)
	is anagram - sort words and match (push on the stack) - record the index or delete that index if you are using while legth condition


2:35

From my calcualtion there are two loops will go through entire main set in the worst case scenario
so O(n) * O(n-1) = O(n^2)


=end


def is_anagram(w1, w2)
	if w1.split(//).sort == w2.split(//).sort
		return true
	end
	return false
end


main = ["eat", "tea", "tan", "ate", "nat", "bat"]

out = []

while( w = main.shift) do

	stack = []

	stack.push(w)

	main.each_with_index do |ww,i|

		if is_anagram(w,ww)
			stack.push(ww)
			main.delete_at(i)
		end

	end

	out.push(stack)

end

p out







