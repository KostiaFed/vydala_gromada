# == Schema Information
#
# Table name: rewards
#
#  id            :bigint           not null, primary key
#  description   :string
#  donation_size :integer
#  item_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  book_id       :bigint
#
# Indexes
#
#  index_rewards_on_book_id  (book_id)
#
FactoryBot.define do
  factory :reward do
  end
end
