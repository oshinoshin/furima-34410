FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name1           {Faker::Name.first_name}
    last_name1            {Faker::Name.last_name}
    first_name2           {Faker::Name.first_name}
    last_name2            {Faker::Name.last_name}
    birthday              {'1995-04-20'}
  end
end