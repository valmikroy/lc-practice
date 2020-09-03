#!/usr/bin/env ruby
#
#
=begin
https://leetcode.com/problems/add-two-numbers/solution/

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.

=end

=begin

this was a very first linked list problem 

essential part of the linked list was managing current pointer 

during additions 
- we have to careful about unevenness in the list
- we have to careful about carryover , if no carry over in current cycle then do not forget to reset it 
- carry over in the last addition has to be considred

=end

class Node 
  attr_accessor :value, :next

  def initialize(v)

    self.value = v
    self.next = nil

  end  

end  

class LinkedList

  attr_accessor :head, :tail, :cur

  def initialize( val )
    self.head = Node.new(val)
    self.tail = self.head
    self.cur = self.head
  end

  def add(val)
    n =  Node.new(val)
    self.tail.next = n
    self.tail = n
  end

  def next
    return nil if self.cur.nil?
    c = self.cur.value
    self.cur = self.cur.next
    return c
  end

  def reset_current
    self.cur = self.head
  end  

  def print()
    n = self.head
    loop do
      puts n.value
      if n.next == nil
        break
      else
        n = n.next
      end
    end
  end


end


a = LinkedList.new(2)
a.add(4)
a.add(9)
a.add(9)


b = LinkedList.new(5)
b.add(6)
b.add(4)

a.reset_current
b.reset_current

carry = 0

c = nil
loop do 
  
  v1 = a.next 
  v2 = b.next 


  if v1.nil? && v2.nil?
    c.add(carry) if carry > 0
    break
  end
    
  v1 = 0 if v1.nil?
  v2 = 0 if v2.nil?

  v3 =  v1 + v2 + carry

  if  v3 > 9 
    carry = (v3/10).to_i  
    remainder = v3%10
    v3 = remainder
  else
    carry = 0
  end  


  if c.nil?
    c = LinkedList.new(v3)
  else
    c.add(v3)
  end  


end  

c.print
