class AddBookLanguage < ActiveRecord::Migration[7.1]
  def change
    change_table :books do |t|
      t.string :language
    end
  end
end
