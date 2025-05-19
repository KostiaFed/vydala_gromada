# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  currency   :string
#  response   :json
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  order_id   :string
#
# Indexes
#
#  index_payments_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
FactoryBot.define do
  factory :payment do
    amount { 1 }
    currency { 'MyString' }
    status { 'MyString' }
    order_id { 'MyString' }
    response { '' }
    book { nil }
  end
end
