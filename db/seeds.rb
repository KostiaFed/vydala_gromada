['Бойовик', 'Детектив', 'Дитяча література', 'Драма', 'Фантастика', 'Фентезі', 'Роман', 'Пригоди', "П'єса", 'Поезія',
 'Гумор'].each do |genre|
  FactoryBot.create(:genre, name: genre)
end
FactoryBot.create_list(:book, 32)

Book.all.each do |book|
  2.times do
    book.genres << Genre.all.sample
  end
end

FactoryBot.create(:user, first_name: 'Костянтин', last_name: 'Федоренко', email: 'email@example.org',
                         password: 'password', confirmed_at: DateTime.now)
