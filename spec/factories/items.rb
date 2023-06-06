FactoryBot.define do
  factory :item do
    name               {Faker::Lorem.characters(number: 10)}
    explanation        {Faker::Lorem.characters(number: 20)}
    category_id        {Faker::Number.between(from: 2, to: 11)}
    condition_id       {Faker::Number.between(from: 2, to: 7)} 
    delivery_charge_id {Faker::Number.between(from: 2, to: 3)}
    area_id            {Faker::Number.between(from: 2, to: 48)}
    number_id          {Faker::Number.between(from: 2, to: 4)}
    price              {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end
end
