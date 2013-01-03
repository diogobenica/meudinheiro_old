class Transaction < ActiveRecord::Base
  attr_accessible :category_id, :description, :transaction_date, :user_id, :value

  validates :transaction_date, presence: true
  validate :transaction_date_is_a_time_object

  def initialize(attributes = {})
    super
    @category_id = attributes[:category_id]
    @description = attributes[:description]
    @transaction_date = attributes[:transaction_date]
    @user_id = attributes[:user_id]
    @value = attributes[:value]
  end

  def transaction_date_is_a_time_object
    errors.add(:transaction_date, "#{transaction_date} is not a Time object [#{transaction_date.class}]") unless transaction_date.class == Time
  end
end
