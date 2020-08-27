#!/usr/bin/env ruby
#

=begin

Given a string S and a string T, find the minimum window in S which will
contain all the characters in T in complexity O(n).

Example:

Input: S = "ADOBECODEBANC", T = "ABC"
Output: "BANC"
Note:

If there is no such window in S that covers all characters in T, return the
empty string "".

If there is such window, you are guaranteed that there will always be only one
unique minimum window in S.

=end

=begin
3:56

start_idx 
middle_idx = 2nd occurance 
final_idxa = third occurance 
compare with length 
take a slice if needed 
else 
start from the middle idx position


shortest = []



for main_str char by char

  take char and match with ever substring char

end

matched all chars flag
match_sub_by_char with a closure

4:19 paused


Failed in misrable manner


5:45 logic prepared

two pointers 
start and mid 


1st match where start = nil
start = cur



if start != nil 
and match is same as previous then  start = cur

if match is differ thant prev then mid = cur



next match where start =! nil and mid != nil 

if match is same as start then  start = mid  and mid = current
if match is same as previous then mid = current
if match is new thne 
  record string size 
  make start = mid
       mid = current


it took me a while to work with two position values but got it right in first try according to above logic



=end





shortest = []

S = "ADOBECODEBANC".split(//)
T = "ABC".split(//)


start = nil

mid = nil

cur = 0


loop do

  if T.include?(S[cur])

    if start.nil? && mid.nil?
      start = cur
    end

    if !start.nil?

      if mid.nil?
        if S[cur] == S[start]
          start = cur
        else 
          mid = cur
        end  
      else
        if S[cur] == S[start]
          start = mid
          mid = cur
        elsif S[cur] == S[mid] 
          mid = cur
        else
          tmp = S.slice(start,cur)
          if shortest.empty?
            shortest = tmp
          else
            shortest = tmp if shortest.length > tmp.length
          end  
          start = mid
          mid = cur
        end


      end




    end

  end
  cur += 1
  break if cur == S.length
end

p shortest
