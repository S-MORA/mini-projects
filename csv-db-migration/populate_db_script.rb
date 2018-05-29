require './models'
require 'csv'

CSV.foreach('./CAR_DATA.csv') do |row|
  unless row[0] == 'id'
   my_customer =  Customer.create(
      first_name: row[1],
      last_name: row[2],
      email: row[3],
      gender: row[4],
      phone_number: row[5]
     )
   my_car = Car.create(
    model: row[6],
    make: row[7],
    cost_price: row[9],
    sale_markup: row[10]
    )
   Transaction.create (
     car: my_car,
     customer: my_customer
    )
end


# Everytime the script is run it clears the database, this
# is okay while working on carson's request.
# Car.destroy_all
# Customer.destroy_all
# Transaction.destroy_all

# Create a few records...
# or import that CSV and create the appropriate records off of it.


# to let you use the terminal to CRUD the database.
