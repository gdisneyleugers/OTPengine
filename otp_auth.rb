require 'rubygems'
require 'bcrypt'
puts "User: "
user = 'USR: ' + gets
users = user.chomp
puts "OTP Pin: "
password =  gets
auth = password.chomp
file = File.open('OTP')  do |file|
us  = file.find { |usr| 'USR'  =~  /USR/ }
usr = us.chomp
pwd = file.find {|pwd| 'PWD' =~ /PWD/ }
pd = pwd.chomp
key = file.find {|key| 'KEY' =~ /KEY/ }
keyd = key.chomp
hasher =  "PWD: " +  BCrypt::Engine.hash_secret(auth, key)
hash = hasher.chomp
puts hash => pd and hash.eql? pd
sleep 1
a = usr == users
b = hash.eql? pd
if a == true; puts "User verified as account linked to OTP"
if b == true; puts "OTP correct to initate session"
if a and b == true; puts 'Successfuly authenticated for session'
store = File.open("OTP", "w")
  store.puts {}
end
end
end

if a == false; puts "User not linked to OTP"
if b == false; puts "OTP failed to initate session"
if a or b == false; puts "Authentication failed for session"
store = File.open("OTP", "w")
store.puts {}
end
end
end
end









