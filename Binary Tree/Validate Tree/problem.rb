#!/usr/bin/env ruby

=begin
Code to read a given binary tree.

=end


class BTree

  attr_accessor :root, :size

  class Node
    attr_accessor :parent, :data, :left, :right 

    def initialize parent, data
      self.parent = parent
      self.data = data
      self.left = nil
      self.right = nil
    end

    def to_s
			puts self.data
			puts self.left
			puts self.right
    end

  end  

  def initialize root
    self.root = root
    self.size = 1
  end  


end
