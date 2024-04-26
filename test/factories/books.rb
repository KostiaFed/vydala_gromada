# == Schema Information
#
# Table name: books
#
#  id                 :integer          not null, primary key
#  collect_ended_at   :datetime
#  collect_started_at :datetime
#  description        :string
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#
# Indexes
#
#  index_books_on_user_id  (user_id)
#
FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    description { Faker::Lorem.paragraph }

    cover { Rack::Test::UploadedFile.new(Dir[Rails.root.join("test", "files", "covers", "*")].sample) }

    user
  end
end
