#!/usr/bin/env ruby
#

=begin
Given a string IP. We need to check If IP is a valid IPv4 address, valid IPv6
address or not a valid IP address.

Return "IPv4" if IP is a valid IPv4 address, "IPv6" if IP is a valid IPv6
address or "Neither" if IP is not a valid IP of any type.

A valid IPv4 address is an IP in the form "x1.x2.x3.x4" where 0 <= xi <= 255
and xi cannot contain leading zeros. For example, "192.168.1.1" and
"192.168.1.0" are valid IPv4 addresses but "192.168.01.1", "192.168.1.00" and
"192.168@1.1" are invalid IPv4 adresses.

A valid IPv6 address is an IP in the form "x1:x2:x3:x4:x5:x6:x7:x8" where:

- 1 <= xi.length <= 4
- xi is hexadecimal string whcih may contain digits, lower-case English letter
('a' to 'f') and/or upper-case English letters ('A' to 'F').
- Leading zeros are allowed in xi.

For example, "2001:0db8:85a3:0000:0000:8a2e:0370:7334" and
"2001:db8:85a3:0:0:8A2E:0370:7334" are valid IPv6 addresses but
"2001:0db8:85a3::8A2E:037j:7334" and "02001:0db8:85a3:0000:0000:8a2e:0370:7334"
are invalid IPv6 addresses. 

Example 1:

Input: IP = "172.16.254.1"
Output: "IPv4"
Explanation: This is a valid IPv4 address, return "IPv4".
Example 2:

Input: IP = "2001:0db8:85a3:0:0:8A2E:0370:7334"
Output: "IPv6"
Explanation: This is a valid IPv6 address, return "IPv6".
Example 3:

Input: IP = "256.256.256.256"
Output: "Neither"
Explanation: This is neither a IPv4 address nor a IPv6 address.
Example 4:

Input: IP = "2001:0db8:85a3:0:0:8A2E:0370:7334:"
Output: "Neither"
Example 5:

Input: IP = "1e1.4.5.6"
Output: "Neither"
 

Constraints:

IP consists only of English letters, digits and the characters '.' and ':'.

=end


=begin

5:39 

- split on . if no elements then
- split on :


valid_ipv4
- number between 0 to 255
- 4 of elemnt present 


valid_ipv6
- 8 elements 
- each elements should match regex of a to f  and digit

5:59

=end




def valid_ipv4(i)
  a = i.split(/\./)
  return false unless a.length == 4

  a.each do |n|
    return false unless (n.to_i >= 0 && n.to_i <= 255)
    return false if n.match(/0/) && n.to_i > 0
    return false if n.match(/0{2,3}/)
  end  
  return true
end  

def valid_ipv6(i)
  a = i.split(/:/)
  return false unless a.length == 8

  a.each do |n|
    return false unless n.match(/[0-9abcdef]/)
    l = n.split(//).length
    return false unless ( l >= 1 && l <= 4 )
  end  

  return true
end  


#ip6 = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
#ip6 = "2001:db8:85a3:0:0:8A2E:0370:7334"
#ip = "2001:0db8:85a3::8A2E:037j:7334"
#ip = "192.168@1.1"
#ip = "192.168.1.00"
#ip = "192.168.01.1"
ip = "192.168.1.0"

if valid_ipv4(ip)
  puts "IPv4"
elsif valid_ipv6(ip)
  puts "IPv6"
else 
  puts "Neither"
end  


