FactoryBot.define do
 
  factory :sends_records_form do 
    post_code   { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }           
    area_id     { Faker::Number.between(from: 2, to: 48) }  
    city        { '東京都千代田区' }
    address     { '青山1-1-1'}
    tel         { Faker::Number.number(digits: 11) }

  
  end
end
