#!/usr/bin/env ruby
#


=begin
https://leetcode.com/problems/reorder-list/
Given a singly linked list L: L0→L1→…→Ln-1→Ln,
reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…


Given 1->2->3->4, reorder it to 1->4->2->3.

Given 1->2->3->4->5, reorder it to 1->5->2->4->3.

=end


=begin

=end


class LinkedList

  class Node 
    attr_accessor :value, :next

    def initialize(v)
      self.value = v
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

    saved_tail = self.tail

    if self.head.nil?
      self.head = n 
    else
      saved_tail.next = n
    end  

    # update tail
    self.tail = n
    self.length += 1

  end

  def find(val)
    n = self.head

    # handle blank list
    return nil if n.nil?

    loop do
      return n if val == n.value
      n.next.nil? ? ( break ) : ( n = n.next )
    end 
    return nil
  end  

  def tail_minus_one
    n = self.head
    raise "blank list" if n.nil?
    prev = nil
    loop do
      if n.next.nil?
        break
      else
        prev = n
        n = n.next
      end  
    end  
    return prev
  end  



  def print()
    n = self.head
    raise "blank list" if n.nil?
    loop do
      puts n.value
      n.next.nil? ? ( break ) : ( n = n.next )
    end  
  end

end  


x = LinkedList.new
x.add(1)
x.add(2)
x.add(3)
x.add(4)
x.add(5)



n = x.head


loop do 

  nn = x.tail


  break if nn == n.next || n.next.nil?


  # update tail
  x.tail = x.tail_minus_one
  x.tail.next = nil

  # swap next pointer
  nn.next = n.next
  n.next = nn

  # new n is every alternate
  n = nn.next

end  




x.print
