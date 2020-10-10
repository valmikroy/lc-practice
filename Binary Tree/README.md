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



#### Tree structure and level order insertion

```ruby
class TreeNode
     attr_accessor :val, :left, :right
     def initialize(val = 0, left = nil, right = nil)
         @val = val
         @left = left
         @right = right
     end
end
```

You can ingest level order tree 

```ruby
def level_order_input_insert(arr)
   root = TreeNode.new(arr[0]) 
   helper([root],arr,1) 
   return root 
end

def helper(nodes,arr,ptr)
    next_nodes=[]
    return if arr.length == ptr    
    while nodes.length != 0 do
        n = nodes.shift
        n.left = TreeNode.new(arr[ptr])
        ptr +=1
        return if arr.length == ptr    
        
        n.right = TreeNode.new(arr[ptr])
        ptr +=1
        next_nodes.push(n.left,n.right)
        return if arr.length == ptr    
    end    
    helper(next_nodes,arr,ptr)
end

a = [1, 2, 3, 4, 5, 6]
root = level_order_input_insert(a)


```

Output  same tree in the level order fashion 

```ruby
def level_order(root)
    return [] if root.nil?
    traverse([root],[]).flatten  
end

def traverse(nodes, results)
  return results if nodes.empty?  
  results << nodes.map{ |n| n.val }
  next_level_nodes = nodes.map{ |n| [n.left, n.right]}.flatten.compact 
  traverse(next_level_nodes,results)  
end

```





#### Other Depth first traversing

- Post

  ```ruby
  def dfs_post(root)
      return [] if root.nil?
      
      return  dfs_post(root.left) + 
              dfs_post(root.right) +
              [ root.val ]
  end
  ```

- Pre

  ```ruby
  def dfs_pre(root)
    return [] if root.nil?
  
    return [ root.val ] +
           dfs_pre(root.left) +
           dfs_pre(root.right)   
  end
  ```

- Inorder

  ```ruby
  def dfs_in(root)
    return [] if root.nil?
  
    return dfs_in(root.left) +
           [ root.val ] +
           dfs_in(root.right)   
  end
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



