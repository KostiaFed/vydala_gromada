class CreateRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :rewards do |t|
      t.integer :donation_size
      t.string :item_name
      t.string :description

      t.timestamps
    end
  end
end
