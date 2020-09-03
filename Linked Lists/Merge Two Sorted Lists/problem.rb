#!/usr/bin/env ruby

=begin
Merge two sorted linked lists and return it as a new sorted list. The new list
should be made by splicing together the nodes of the first two lists.

Example:

Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4
=end

=begin

if v1 < v2
  add v1 first then v2
if v1 > v2 
  add v2 first then v1

if v1 ==  v2
  then add v1 then v2


I have to use an array to keep a track on dangling nulls  
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
    self.cur  = self.head
  end



  def add(val)
    n = Node.new(val)
    self.tail.next = n
    self.tail = n
  end

  def next
    return nil if self.cur.nil?
    v =  self.cur.value
    self.cur = self.cur.next
    return v
  end  

  def reset_cur
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

  def each 

    if block_given?
      while n = self.next
        yield n
      end  
    else  
      self.print
    end

  end  

end  


a = LinkedList.new(1)
a.add(2)
a.add(4)


b = LinkedList.new(1)
b.add(3)
b.add(4)

c = nil

loop do 
  v1 = a.next
  v2 = b.next

  break if v1.nil? && v2.nil?

  ordered = []


  ordered.push(v2) if v1.nil?
  ordered.push(v1) if v2.nil?


  if v1 > v2
    ordered.push(v2)
    ordered.push(v1)
  else
    ordered.push(v1)
    ordered.push(v2)
  end  
    

  ordered.each do |v|
    if c.nil?
      c = LinkedList.new(v)
    else
      c.add(v)
    end  
  end  
    


end  


c.each

