#!/usr/bin/env ruby
#

=begin
Remove the minimum number of invalid parentheses in order to make the input string valid. Return all possible results.

Note: The input string may contain letters other than the parentheses ( and ).

Input: "()())()"
Output: ["()()()", "(())()"]
=end

=begin


end condition is when you reached to the last charater 


direction flag will either match ( or  )


direction flag indicates that stack for open parenthesis is full and we have start ignoring letters which do not close parenthesis.

we need counter of unclosed parenthsis 
we need max capacity for unclosed parenthesis 


start counter 

if unclosed parenthesis 
update the counter 
next expected char can be anything 
but when counter is full - next expected chart must be something 



=end



$max = 2

$cnt = 0

flag = 0



input = '()())()'

def parenthesis(i=[])
  c = i.shift

  if i.length == 0 
    $cnt = $cnt + 1 
    return c
  else
    str = parenthesis(i)

    if is_it_closing(c,str)
      $flag = 0 if $cnt == 0
      $cnt = $cnt - 1 if $cnt > 0
      return c + str
    else
      $flag = 1 if $cnt == $max
      return str if $flag
      $cnt = $cnt + 1
      return c + str
    end  
  end  

end  


def is_it_closing(c,s)
  prev =  pull_stack(s)

  if c == '(' && prev == ')'
    return true
  end  

  return false
end  



def pull_stack(s=nil)
  return s.split(//)[0]
end  

p parenthesis(input.split(//))
