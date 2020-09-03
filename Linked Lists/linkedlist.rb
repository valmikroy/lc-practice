#!/usr/bin/env ruby
#
#
#

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


x = LinkedList.new(5)
x.add(10)
x.add(15)


x.each do |n|
  puts n * 10
end  
