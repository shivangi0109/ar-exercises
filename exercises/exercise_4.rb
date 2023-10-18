require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...

# 1. Create 3 more stores
Store.create(name: 'Surrey', annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
Store.create(name: 'Whistler', annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
Store.create(name: 'Yaletown', annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

# Fetch stores that carry men's apparel
@mens_stores = Store.where(mens_apparel: true).order(created_at: :desc)

# Output name and annual revenue of each men's store
puts "Men's Apparel Stores:"
@mens_stores.each do |store|
  puts "Name: #{store.name}, Annual Revenue: #{store.annual_revenue}"
end

# Fetch stores that carry women's apparel and generate less than $1M
@womens_stores = Store.where("womens_apparel = ? AND annual_revenue < ?", true, 1000000)

# 5. Output name and annual revenue of each qualifying women's store
puts "\nWomen's Apparel Stores (Revenue < $1M):"
@womens_stores.each do |store|
  puts "Name: #{store.name}, Annual Revenue: #{store.annual_revenue}"
end
