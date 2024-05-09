# == Schema Information
#
# Table name: books_genres
#
#  book_id  :bigint           not null
#  genre_id :bigint           not null
#
class BooksGenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre
end
