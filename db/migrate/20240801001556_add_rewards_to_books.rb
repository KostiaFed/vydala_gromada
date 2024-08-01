class AddRewardsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_reference :rewards, :book
  end
end
