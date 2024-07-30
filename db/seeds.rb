FactoryBot.create_list(:genre, 8)
FactoryBot.create_list(:book, 32)

Book.all.each do |book|
  2.times do
    book.genres << Genre.all.sample
  end
end

FactoryBot.create(:user, email: "email@example.org", password: "password", confirmed_at: DateTime.now)
