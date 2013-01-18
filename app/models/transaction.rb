# encoding: UTF-8
class Transaction < ActiveRecord::Base
  attr_accessible :category_id, :description, :transaction_date, :user_id, :value

  validate :transaction_date_is_a_time_object

  def initialize(attributes = {})
    super
    @category_id = attributes[:category_id]
    @description = attributes[:description]
    unless attributes[:transaction_date].nil? || attributes[:transaction_date].empty?
      begin
        @transaction_date = Date.parse(attributes[:transaction_date]) 
      rescue
        @transaction_date = nil
      end
    end
    @user_id = attributes[:user_id]
    @value = attributes[:value]
  end

  def transaction_date_is_a_time_object
    if @transaction_date.nil? || @transaction_date.class != Date then
      errors.add(:transaction_date, "A data está vazia ou inválida")
    end
  end
end
