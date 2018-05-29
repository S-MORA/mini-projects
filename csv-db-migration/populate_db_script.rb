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
   PurchaseTransaction.create (
     car: my_car,
     customer: my_customer
    )
  end
end
