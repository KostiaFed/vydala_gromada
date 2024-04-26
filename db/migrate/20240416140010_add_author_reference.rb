class AddAuthorReference < ActiveRecord::Migration[7.1]
  def change
    add_reference :books, :user, index: true
  end
end
