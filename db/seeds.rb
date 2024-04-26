FactoryBot.create_list(:genre, 8)
FactoryBot.create_list(:book, 8)

Book.all.each do |book|
  2.times do
    book.genres << Genre.all.sample
  end
end