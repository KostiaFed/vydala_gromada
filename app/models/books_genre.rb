# == Schema Information
#
# Table name: books_genres
#
#  book_id  :integer          not null
#  genre_id :integer          not null
#
class BooksGenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre
end
