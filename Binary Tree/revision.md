Revision of tree related functions


```ruby
#!/usr/bin/env ruby

class Tree 
    attr_accessor :left, :right, :val
    def initialize(val=0,left=nil,right=nil)
        self.val = val
        self.left = left
        self.right = right
    end
end

def ingest_level_order_input(arr)
   root =  Tree.new(arr[0]) 
   helper([root],arr,1)
   return root 
end


def helper(nodes,arr,ptr)
    next_nodes = []
   
    return if arr.length == ptr
    while nodes.length !=0 do 
        n = nodes.shift
        
        n.left =  Tree.new(arr[ptr])
        ptr += 1
        
        return if arr.length == ptr
        
        n.right =  Tree.new(arr[ptr])
        ptr += 1
        
        next_nodes.push(n.left,n.right)
        
        return if arr.length == ptr
    end
    
    helper(next_nodes,arr,ptr)
end

a = [1, 2, 3, 4, 5, 6]
root = ingest_level_order_input(a)


def traverse_inorder(root)
  return [] if root.nil? 
  return   traverse_inorder(root.left) + [root.val] + traverse_inorder(root.right)
end

def traverse_postorder(root)
  return [] if root.nil? 
  return   traverse_postorder(root.left) +  traverse_postorder(root.right) + [root.val] 
end

def traverse_preorder(root)
  return [] if root.nil? 
  return   [root.val] + traverse_preorder(root.left) +  traverse_preorder(root.right)
end

def traverse_levelorder(root)
    return helper_levelorder([root],[]).flatten
end

def helper_levelorder(nodes,result=[])
   return result if nodes.empty?
   result << nodes.map { |n| n.val } 
   next_nodes = nodes.map{ |n| [n.left,n.right] }.flatten.compact
   helper_levelorder(next_nodes,result) 
end


def max_depth(root)
  return 0 if root.nil?  
  left = max_depth(root.left)  
  right = max_depth(root.right)  
  return left > right ? left + 1 : right + 1
end

def max_path_sum(root)
    helper_max_path(root,[])
end

def helper_max_path(root,vals=[])
    
    if root.nil?
        sum = vals.inject(0) {|sum,n| sum +=n }
        puts "#{sum}  #{vals}"
    else
        vals << root.val
        helper_max_path(root.left,vals.clone)
        helper_max_path(root.right,vals.clone)
    end
end


p traverse_inorder(root)
p traverse_postorder(root)
p traverse_preorder(root)
p traverse_levelorder(root)
p max_depth(root)
max_path_sum(root)
```
