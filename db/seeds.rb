['Бойовик', 'Детектив', 'Дитяча література', 'Драма', 'Фантастика', 'Фентезі', 'Роман', 'Пригоди', "П'єса", 'Поезія',
 'Гумор'].each do |genre|
  Genre.create!(name: genre)
end

FactoryBot.create_list(:book, 32) if Rails.env.development?

Book.all.each do |book|
  2.times do
    book.genres << Genre.all.sample
  end
end

User.create!(
  first_name: 'System',
  last_name: 'Admin',
  email: 'sysadmin@example.org',
  password: 'password',
  confirmed_at: DateTime.now
)
