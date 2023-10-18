require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'

puts "Exercise 3"
puts "----------"

# Your code goes here ...

# Load the third store
@store3 = Store.find(3)

# Delete the third store
@store3.destroy

# Verify deletion by outputting the count
puts "Number of stores after deletion: #{Store.count}"
