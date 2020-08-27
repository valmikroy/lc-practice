#!/usr/bin/env ruby
#
=begin
https://leetcode.com/problems/merge-sorted-array

Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one
sorted array.

Note:

The number of elements initialized in nums1 and nums2 are m and n respectively.
You may assume that nums1 has enough space (size that is equal to m + n) to
hold additional elements from nums2.

Example:

Input:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

Output: [1,2,2,3,5,6]


Constraints:

-10^9 <= nums1[i], nums2[i] <= 10^9
nums1.length == m + n
nums2.length == n

=end



=begin
3:20

- Create a new empty array which will be new sorted array 
- num2[i] > num1[i]  then shift num1 and push to new array
- num2[i] < num1[i] then push num2[i]

3:39 wrong logic realized
3:44 corrected logic and things are working

time 

=end

nums1 = [1,2,3]
nums2 = [2,5,6]

n = []

loop do
	if nums2.length == 0 
		n.push(nums1).flatten if nums1.length > 0
		n.flatten!
		break
	end
	if nums1.length == 0 
		n.push(nums2) if nums2.length > 0
		n.flatten!
		break
	end

	n1 =  nums1.shift
	n2 =  nums2.shift

	p n

	if n2 > n1
		n.push(n1)
		nums2.unshift(n2)
	elsif n2 < n1
		n.push(n2)
		nums1.unshift(n1)
	elsif n2 == n1
		n.push(n1)
		n.push(n2)
	end

end

p n
