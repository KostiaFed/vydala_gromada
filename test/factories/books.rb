# == Schema Information
#
# Table name: books
#
#  id                 :bigint           not null, primary key
#  collect_ended_at   :datetime
#  collect_started_at :datetime
#  description        :string
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_books_on_user_id  (user_id)
#
FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    description { Faker::Lorem.paragraph_by_chars(number: 1000) }

    cover { Rack::Test::UploadedFile.new(MiniMagick::Image.new(Dir[Rails.root.join("test", "files", "covers", "*")].sample).resize("150x200>").path) }

    user
  end
end
