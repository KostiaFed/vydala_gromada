# == Schema Information
#
# Table name: books
#
#  id                 :bigint           not null, primary key
#  book_url           :string
#  collect_ended_at   :datetime
#  collect_started_at :datetime
#  language           :string
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
class Book < ApplicationRecord
  has_one_attached :cover

  has_many_attached :illustrations

  has_rich_text :long_description

  belongs_to :user

  has_many :books_genres, dependent: :destroy
  has_many :genres, through: :books_genres
  has_many :rewards, dependent: :destroy
  has_many :payments, dependent: :nullify

  accepts_nested_attributes_for :rewards, allow_destroy: true

  validates :cover, attached: true, content_type: ['image/png', 'image/jpeg']
end
