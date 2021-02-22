FactoryBot.define do
  factory :user do
    nickname              {'shinya'}
    email                 {Faker::Internet.email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name1           {'戸田'}
    last_name1            {'信也'}
    first_name2           {'トダ'}
    last_name2            {'シンヤ'}
    birthday              {'1995-04-20'}
  end
end