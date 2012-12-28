class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.date :transaction_date
      t.decimal :value
      t.integer :category_id
      t.string :description

      t.timestamps
    end
  end
end
