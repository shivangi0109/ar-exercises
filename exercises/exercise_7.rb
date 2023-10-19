require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

# Ask the user for a store name
print "Enter a store name: "
store_name = gets.chomp

# Attempt to create a store with the inputted name (leave out other fields)
new_store = Store.new(name: store_name) # This will show error messages

# new_store = Store.new(name: store_name, annual_revenue: 6000000, mens_apparel: true) # This won't show error messages because it is validating everything and saving

# Display error messages if save/create fails
unless new_store.save
  puts "Errors:"
  new_store.errors.full_messages.each do |error|
    puts error
  end
end