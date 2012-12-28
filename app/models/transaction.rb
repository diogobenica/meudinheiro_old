class Transaction < ActiveRecord::Base
  attr_accessible :category_id, :description, :transaction_date, :user_id, :value
end
