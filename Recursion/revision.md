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

