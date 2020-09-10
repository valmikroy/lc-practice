#!/usr/bin/env ruby
#


=begin 

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.


Input:
List1: 7->5->9->4->6 // represents number 64957
List2: 8->4 // represents number 48
Output:
Resultant list: 5->0->0->5->6 // represents number 65005
Explanation: 64957 + 48 = 65005

=end 

=begin
2pm

- create a linked list - singly linked 
- add a length field if it was a substraction
- loop through two lists together
- add and carry over 
- if one of the list is nil then assume zero 
- repeat till longest list is completed 

2:25

remmeber the / is carry and % is number

=end



class LL
  class Node
    attr_accessor :value, :next

    def initialize(val)
        self.value = val
        self.next = nil
    end  
  end  


  attr_accessor :head, :tail, :length

  def initialize
    self.head = nil
    self.tail = nil
    self.length = 0
  end  

  def add(val)
    n = Node.new(val)

    if self.head.nil? 
      self.head = n
    else
      self.tail.next = n
    end  
    self.tail = n
    self.length += 1
  end


  def print
    n = self.head
    return if self.head.nil?

    loop do 
      break if n.nil?
      puts n.value
      n = n.next
    end  

  end  
  
end  

# 64957 + 48

a = LL.new()
#a.add(5)
#a.add(6)
#a.add(3)
a.add(7)
a.add(5)
a.add(9)
a.add(4)
a.add(6)


b = LL.new()
#b.add(8)
#b.add(4)
#b.add(2)
b.add(8)
b.add(4)



c = LL.new()


x = a.head
y = b.head
carry = 0

loop do
  break if x.nil? && y.nil?
  x.nil? ? (xv = 0) :  (xv = x.value)
  y.nil? ? (yv = 0) :  (yv = y.value)


  z = xv + yv + carry

  if z > 9
    c.add((z%10).to_i)
    carry  = z / 10
  else
    c.add(z)
    carry = 0
  end  



  x.nil? || x.next.nil? ? ( x = nil ) : ( x = x.next )
  y.nil? || y.next.nil? ? ( y = nil ) : ( y = y.next )
end  


a.print
puts "-"
b.print
puts "-"
c.print






