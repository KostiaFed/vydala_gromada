# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :genre do
    name do
      ['Бойовик', 'Детектив', 'Дитяча література', 'Драма', 'Фантастика', 'Фентезі', 'Роман', 'Пригоди', "П'єса", 'Поезія',
       'Гумор'].sample
    end
  end
end
