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
class Book < ApplicationRecord
  has_one_attached :cover

  belongs_to :user

  has_many :books_genres
  has_many :genres, through: :books_genres

  validates :cover, attached: true, content_type: ['image/png', 'image/jpeg']
end
