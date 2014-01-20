require 'rubygems'
require 'openssl'
require 'rotp'
require 'bcrypt'
puts "User to link OTP Engine: "
user = gets
usr = user.chomp
count = 0
loop do
  input = gets
 input == '\n'
  random = rand(64*64*64*64*64*64*64*64/2)
  initcount = rand(64*random)
  #Menemonic override
 count = count+initcount
seed = (0...128).map { ('a'..'0').to_a[rand(64)] }.join
#Timed Baded
#totp = ROTP::TOTP.new(seed)
hotp = ROTP::HOTP.new(seed)
pwd = hotp.at(count)
  puts "OTP Pin: "
  puts pwd
  puts "Verifying"
  puts hotp.verify(pwd, count)
salt = BCrypt::Engine.generate_salt
password = BCrypt::Engine.hash_secret(pwd, salt)
if true ; password == pwd
 pd = password.chomp
 puts password => pd
 puts "OTP Pin set for Session"
 store = File.open("OTP", "w")
 store.puts "USR: " + usr
 store.puts "PWD: " + pd
 store.puts  salt
 store.close
if false;
puts "Password Failed"
end
end
  end



