FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Alphanumeric.alphanumeric(number: 8)}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'陸太郎'}
    last_kana             {'ヤマダ'}
    first_kana            {'リクタロウ'}
    birth_date            {Faker::Date.between(from: "1930-01-01", to: "2018-12-31")}
  
  end
end