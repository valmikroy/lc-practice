#!/usr/bin/env ruby
#

=begin
Given two non-negative integers num1 and num2 represented as strings, return
the product of num1 and num2, also represented as a string.

Example 1:

Input: num1 = "2", num2 = "3"
Output: "6"
Example 2:

Input: num1 = "123", num2 = "456"
Output: "56088"

Note:
- The length of both num1 and num2 is < 110.
- Both num1 and num2 contain only digits 0-9.
- Both num1 and num2 do not contain any leading zero, except the number 0 itself.
- You must not use any built-in BigInteger library or convert the inputs to integer directly.

=end

=begin

11:15

num1[i] - longest
num2[j]

afa = [
	[] size of i or more 
	[]
] size of j


loop1 j=n2 to j=0

  loop2 i=n1 to i=0


  num[j] * num[i]  + quotient if any  = 

	if i is the last element then just push the product by splitting it into quotient and remainder
	pushed on to an array afa[j][i] if single digit 
   if multiple digit then 
	largest will be 36
	  divide it by 10 and push remainder in the array 
	quotient will get stored and added for the next cycle 


end


find the longest array size to start with the counter  or note it down in the prevoius loop.

final [] length of 
loop j=n or more to j=0

and push them on the array stack


finished at 1:29 - it was a long problem with many mistakes

=end


require 'pp'


n2="234351513123241252151251252151251252151251252151252151251251215125"
n1="456235315151512515212152111254"

num1=n1.split(//).map{ |d| d.to_i}
num2=n2.split(//).map{ |d| d.to_i}



l1 = num1.length
l2 = num2.length

if l1 < l2
  tmp = num2
  num2 = num1
  num1 = tmp

  tmp = l2
  l2 = l1
  l1 = tmp
end


j = l2-1
i = l1-1


dim2 = []



while j >= 0 

  dim1 = []
  q = 0

  ii = i
  while ii >=0
    p = num2[j] * num1[ii]
    p = p + q
    q = 0 # reset quotient after use



    if p > 9
      q = (p/10).to_i
      r = p%10
      dim1.unshift(r)
    else
      dim1.unshift(p)
    end

    if ii == 0
      dim1.unshift(q)
    end

    ii = ii - 1
  end

  (l2-1 - j).times do 
    dim1.push(0)
  end  

  dim2.push(dim1.dup)

  j = j - 1
end



l3 = 0
dim2.each do |d|
  l3 =  d.length if d.length > l3
end

dim2.each do |d|
  diff = l3 - d.length
  diff.times do
    d.unshift(0)
  end  
end


k = l3-1
l = dim2.length-1



product = Array.new(k)


q = 0
while  k >=0
  ll = l
  while ll >=0
    product[k] =0 if product[k].nil?
    product[k] = product[k] + dim2[ll][k]
    ll = ll - 1
  end

  product[k] = product[k] + q
  if product[k] > 9
    q = (product[k]/10).to_i
    r = (product[k]%10)
    product[k] = r
  else
    q = 0
  end


  if k == 0 && q > 0
    product.unshift(q) 
  end  


  k = k - 1
end


product.each {|d| print d}
printf("\n")



