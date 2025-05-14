class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :currency
      t.string :status
      t.string :order_id
      t.json :response
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
