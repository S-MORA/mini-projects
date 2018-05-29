require 'sinatra/activerecord'

# Based on http://www.jonathanleighton.com/articles/2011/awesome-active-record-bug-reports/


# Define the models and relationships
class Car < ActiveRecord::Base
  has_one :purchase_transaction
end

class Customer < ActiveRecord::Base
  has_one :purchase_transaction
end

class PurchaseTransaction < ActiveRecord::Base
  belongs_to :car
  belongs_to :customer
end
