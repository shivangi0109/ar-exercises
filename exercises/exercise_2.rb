require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

# Your code goes here ...

# 1. Load the first store
@store1 = Store.find(1)

# 2. Load the second store
@store2 = Store.find(2)

# 3. Update the first store
@store1.update(name: 'Edmonton')

# Output the updated store information
puts "Updated store name: #{@store1.name}"