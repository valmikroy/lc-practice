# Binary Tree

BST

- Value of the node must be `greater than (or equal to)` any values stored in the left side of subtree.
- Value of the node must be `less than (or equal to)` any values stored in the right side of the subtree.

BST can be traversed

- preorder 
- inorder 
- postorder 
- level-order



All Depth first parsings are 0(N) for both space and time.





![postorder](images/145_transverse.png)



#### Tree defination 

```ruby
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
```





#### Postorder

```ruby
def postorder_traversal(root)
        return [] if root.nil?
        return postorder_traversal(root.left) + 
               postorder_traversal(root.right) + 
               [root.val]
end
```



#### Preorder 

```ruby
def preorder_traversal(root)
    return [] if root.nil?
    return [root.val] + 
           preorder_traversal(root.left) +
           preorder_traversal(root.right)    
end
```



#### Inorder

```ruby
def inorder_traversal(root)
        return [] if root.nil?
        return inorder_traversal(root.left) + 
               [root.val]  + 
               inorder_traversal(root.right) 
end
```



#### Breadth first

```ruby
def level_order(root)
    return [] if root.nil?
    traverse([root],[])
end

def traverse(nodes, results)
  return results if nodes.empty?  
  results << nodes.map{ |n| n.val }
  next_level_nodes = nodes.map{ |n| [n.left, n.right]}.flatten.compact 
  traverse(next_level_nodes,results)  
end
```

#### Leedcode glue
Glue code which LC provides for the binary tree

```ruby
#!/usr/bin/env ruby
#

class TreeNode
     attr_accessor :val, :left, :right
     def initialize(val = 0, left = nil, right = nil)
         @val = val
         @left = left
         @right = right
     end
end


# push function
def pushNode(node, val)
    return if val.nil?
    if(val > node.val)
     if(node.right)
      pushNode(node.right, val)
     else
      node.right = TreeNode.new(val)
     end
    else
     if(node.left)
      pushNode(node.left, val)
     else
      node.left = TreeNode.new(val)
     end
    end
end

# traverse functions
def postorder_traversal(root)
        return [] if root.nil?
        return postorder_traversal(root.left) +
               postorder_traversal(root.right) +
               [root.val]
end


def preorder_traversal(root)
    return [] if root.nil?
    return [root.val] +
           preorder_traversal(root.left) +
           preorder_traversal(root.right)
end


def inorder_traversal(root)
        return [] if root.nil?
        return inorder_traversal(root.left) +
               [root.val]  +
               inorder_traversal(root.right)
end


# your leetcode input
#arr = [5,6,2,4,1,8,7,9,3];
arr = [5,1,4,nil,nil,3,6]


root = TreeNode.new(arr.shift);
arr.each{|e| pushNode(root, e) }




p postorder_traversal(root)
p inorder_traversal(root)
p preorder_traversal(root)
```



#### Max depth 

```ruby
def max_depth(root)
        return 0 if root.nil?
        left = max_depth(root.left)
        right = max_depth(root.right)
        return left > right ? left + 1 : right + 1
end
```



#### Is symmetric

```ruby
def is_symmetric(root)
    return true if root.nil?
    helper(root.left,root.right) 
end


def helper(left,right)
    
    return true if left.nil? && right.nil?
    return false if left.nil? || right.nil?
    
    return left.val == right.val && helper(left.left,right.right) && helper(right.left, left.right)
    
end
```



#### Path sum

```ruby
def has_path_sum(root, sum)
    helper(root,[],sum)
end


def helper(node, path=[],sum)
    
   if node.nil? 
    s = 0
    path.each{ |n| s += n }
    s == sum ? ( return true ) : ( return false )
   elsif node.left.nil?
    path << node.val 
    return helper(node.right,path.clone,sum)
   elsif node.right.nil?
    path << node.val 
    return helper(node.left,path.clone,sum)
   else
    path << node.val 
    return helper(node.left,path.clone,sum) || helper(node.right,path.clone,sum)
   end
    
end
```



















![Image for post](/Users/abhisawa/git/lc-practice/lc-practice/assets/binary_tree_o_notations.png)



