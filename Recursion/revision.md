#### Find number of ways 
If there is point onwards you can do X number of ways in a repeatative manner. Then you can recurse into each possible steps to do things until it reaches to the point where it can do that thing only one way.

Climbing stairs is one of those type of problem

```ruby
#!/usr/bin/env ruby

# You are climbing a stair case. It takes n steps to reach to the top.
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

def climbing_stairs(n)
    return 1 if n <= 1    
    
    ret1 = climbing_stairs(n-1)
    ret2 = climbing_stairs(n-2)
    
    return ret1 + ret2
end

p climbing_stairs(10)
```


#### Traversing through the matrix using recursion 

```ruby
#!/usr/bin/env ruby

matrix = [
    [ 1, 2, 3, 4, 5],
    [ 6, 7, 8, 9,10],
    [11,12,13,14,15],  
    [16,17,18,19,20],
    [21,22,23,24,25]
]


def serialize(matrix)
    stack = []
    helper(0,0,matrix,stack)
    puts "#{stack}"
end

def helper(x,y,matrix,stack)
    
    element = matrix[y][x] 
    stack.push(element) unless stack.include?(element)
    
    max_x = matrix[0].length - 1 
    max_y = matrix.length - 1
    
    # Swapping of below if statements will convert DFS to BFS
    if x+1 <= max_x
       helper(x+1,y,matrix,stack) 
    end
    
    if y+1 <= max_y
       helper(x,y+1,matrix,stack) 
    end
    
end

serialize(matrix)
```

#### Permutation and Combination 

```ruby
# permutation and combination

nums = ['A','B','C','D','E']


def permute(nums)
  out = []  
  helper(nums,0,out)  
  return out  
end


def helper(nums,idx,out)
    out.push(nums.clone) if idx == nums.length   
    (idx ... nums.length).each do |i|
        nums[i],nums[idx] = nums[idx],nums[i]
        helper(nums,idx+1,out)
        nums[i],nums[idx] = nums[idx],nums[i]
    end
end

out = permute(nums)

combo = []
out.each {|x| combo.push("#{x[0]}#{x[1]}") unless combo.include?("#{x[0]}#{x[1]}") }

puts combo

```
