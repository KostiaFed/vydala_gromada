class AddContactField < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.jsonb :contacts
    end
  end
end
