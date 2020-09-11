#!/usr/bin/env ruby
#


=begin

Given a collection of distinct integers, return all possible permutations.


Input: [1,2,3]
Output:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]

=end

=begin

- take a stack of number 
- recursion function keep fetching a single element in every level till stack get empty 
- recurse back with an all combination array
- work on that returned array as an input to for loops

=end



#input = [ 1, 2, 3 ]
input = [ 1, 1, 2 ]

$levels = input.length


def perm(i=[])


  n =  i.shift
  out = []

  if i.length == 0
    (0..$levels-1).each do |idx| 
      o = Array.new($levels, nil)
      o[idx] = n
      out.push(o)
    end  
  else
    combo = perm(i)

    combo.each do |each_combo|

      each_combo.each_with_index do |a,idx|
        if a.nil?
          b = each_combo.clone
          b[idx] = n
          out.push(b) unless out.include?(b)
        end  
      end  


    end

  end

  return out

end  



p perm(input)

