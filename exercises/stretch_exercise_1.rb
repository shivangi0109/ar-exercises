require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'
require_relative './exercise_7'

puts "Stretch Exercise 1"
puts "----------"

# Your code goes below here ...

# Create an employee for an existing store without specifying a password
existing_store = Store.first # Assume you have an existing store
new_employee = existing_store.employees.new(
  first_name: 'John',
  last_name: 'Doe',
  hourly_rate: 50
)

# Save the employee, and the before_create callback should generate a password
if new_employee.save
  puts "Employee created successfully!"
  puts "Generated Password: #{new_employee.password}"
else
  puts "Error creating employee: #{new_employee.errors.full_messages.join(', ')}"
end

# Run this file using bundle exec ruby exercises/stretch_exercise_1.rb in terminal
