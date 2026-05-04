
# simple_hash = {:a => 1, :b => 2}
# simple_hash[:c] = 3
# simple_hash[:a] = "someone"
#
#
#
# simple_hash.select do |key, value|
#   if value == "someone"
#     simple_hash.delete(key)
#   end
# end
# p simple_hash

# def multiply(a, b)
#   a.to_f * b.to_f
# end
#
# def divide(a, b)
#   a.to_f / b.to_f
# end
#
# def add(a, b)
#   a.to_f + b.to_f
# end
#
# def subtract(a, b)
#   a.to_f - b.to_f
# end
#
# def modulo(a, b)
#   a.to_f % b.to_f
# end
#
# puts "Hello, this is simple calculator"
# puts "Enter your numbers"
# puts "First number"
# first_number = gets.chomp
#
# puts "Second number"
# second_number = gets.chomp
#
# puts "Choose operation"
# puts "1. multiply"
# puts "2. divide"
# puts "3. add"
# puts "4. subtract"
# puts "5. modulo"
#
# operation = gets.chomp
#
# if operation == "1"
#   puts "your result is: #{multiply(first_number, second_number)}"
# elsif operation == "2"
#   puts "your result is: #{divide(first_number, second_number)}"
# elsif operation == "3"
#   puts "your result is: #{add(first_number, second_number)}"
# elsif operation == "4"
#   puts "your result is: #{subtract(first_number, second_number)}"
# elsif operation == "5"
#   puts "your result is: #{modulo(first_number, second_number)}"
# else
#   puts "Invalid operation"
# end
#

#  authentication function
#
# def authenticate(username, password)
#   user_list = [
#     { username: "user_1", password: "password_1" },
#     { username: "user_2", password: "password_2" },
#     { username: "user_3", password: "password_3" },
#     { username: "user_4", password: "password_4" },
#   ]
#
#   valid_user = nil
#   user_list.each do |user|
#     if user[:username] == username && user[:password] == password
#       valid_user = user
#     end
#   end
#
#   if valid_user
#     puts "You are authenticated!"
#     p valid_user
#     true
#   else
#     puts "Invalid username or password"
#     false
#   end
# end
#
# is_end = false
# limit = 2
# while !is_end && limit > 0
#   puts "This program will take input from the user and compare passwords"
#   puts "Enter your username:"
#   username = gets.chomp
#   puts "Enter your password:"
#   password = gets.chomp
#
#   credential_valid = authenticate(username, password)
#
#   unless credential_valid
#     limit -= 1
#     puts "You have #{limit} attempts left"
#   end
#
#   if limit == 0
#     break 1
#   end
#
#   puts "Press n to quit or any key to try again"
#   n = gets.chomp
#   if n == "n"
#     is_end = true
#   end
# end

#-------------------------------------

dial_book = {
  "newyork" => "212",
  "newbrunswick" => "732",
  "edison" => "908",
  "plainsboro" => "609",
  "sanfrancisco" => "301",
  "miami" => "305",
  "paloalto" => "650",
  "evanston" => "847",
  "orlando" => "407",
  "lancaster" => "717"
}

# Get city names from the hash
def get_city_names(city_hash, name)
  city_hash.keys.find { |key| key.downcase == name }
end

# Get area code based on given hash and key
def get_area_code(city_hash, key)
  city_hash[key]
end

n = 1
while n > 0
  puts "Enter the city name you want to know the area code for:"
  city_name = gets.chomp.downcase
  city = get_city_names(dial_book, city_name)
  if city.nil?
    puts "Invalid city name. Please try again."
    next
  end
  area_code = get_area_code(dial_book, city)
  puts "The area code for #{city} is #{area_code}"
  puts "Press 1 to continue or 0 to exit"
  n = gets.chomp.to_i
  if n == 0
    break
  end
end