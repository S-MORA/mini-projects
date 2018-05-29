require 'sinatra/activerecord'

class Car < ActiveRecord::Base
  has_one :purchase_transaction
end

class Customer < ActiveRecord::Base
  has_one :purchase_transaction
end

class PurchaseTransaction < ActiveRecord::Base
  belongs_to :car
  belongs_to :customer

  def sale_price
    #this outputs the final sale price plus 8.8 percent sales tax
    car.cost_price + (car.cost_price + car.sale_markup/100) + (car.cost_price * .088)
  end
end
