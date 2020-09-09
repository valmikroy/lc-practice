#!/usr/bin/env ruby
#
#
#


class LinkedList

  class Node 
    attr_accessor :value, :next, :prev

    def initialize(v)
      self.value = v
      self.next = nil
      self.prev = nil
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

    # handle two conditions
    # - first - if both head and tail are nil that means empty list then point both head and tail to same node.
    # - second - if populated list then modify tail->next pointer to new structure before updating tail itself.
    # update tail to new node in all the cases
    #

    saved_tail = self.tail

    if self.head.nil?
      # add node to head if list is empty
      self.head = n 
    else
      # if list is NOT empty then update tail->next to new node before we update tail pointer.
      saved_tail.next = n
    end  

    # update tail
    self.tail = n
    self.tail.prev = saved_tail
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

  def remove(val)

    n =  self.find(val)

    # if given value is not found
    return false if n.nil?

    # condition 1 - head and tail are the same 
    if n.prev.nil? && n.next.nil?
      # if this is a single node in the list
      self.head = nil
      self.tail = nil
    elsif n.prev.nil?
      # if head node
      self.head =  n.next
      self.head.prev = nil
    elsif n.next.nil?
      # if tail node
      tail = n.prev
      tail.next = nil
    else
      # ordinary node with both pointers populated
      n_prev = n.prev
      n_next = n.next

      n_prev.next =  n_next
      n_next.prev = n_prev
    end

    return true


  end



  def print()
    n = self.head
    raise "blank list" if n.nil?
    loop do
      puts n.value
      n.next.nil? ? ( break ) : ( n = n.next )
    end  
  end

  def each 

    raise "blank list" if self.head.nil?

    if block_given?
      n = self.head
      loop do
        yield n
        n.next.nil? ? ( break ) : ( n = n.next )
      end  
    else  
      self.print
    end

  end  

end  


x = LinkedList.new
x.add(10)
x.add(15)
x.add(20)
x.add(25)
x.add(30)

x.print

x.each do |n|
  puts n.value * 10
end  

puts "remove middle"
x.remove(20)

puts "remove tail"
x.remove(30)

puts "remove head"
x.remove(10)


puts "print final"
x.print


puts "remove tail"
x.remove(25)

puts "print final"
x.print

puts "remove head"
x.remove(15)

puts "print final"
x.print

