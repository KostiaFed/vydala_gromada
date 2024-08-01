# == Schema Information
#
# Table name: books
#
#  id                 :bigint           not null, primary key
#  book_url           :string
#  collect_ended_at   :datetime
#  collect_started_at :datetime
#  long_description   :string
#  name               :string
#  short_description  :string
#  video_url          :string
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
    short_description { Faker::Lorem.paragraph_by_chars(number: 1000) }

    cover do
      Rack::Test::UploadedFile.new(Dir[Rails.root.join('test', 'files', 'covers', '*')].sample)
    end

    user
  end
end
