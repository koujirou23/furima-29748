FactoryBot.define do
  factory :item do
    name             {'商品名が入ります1aア２'}
    text             {Faker::Lorem.sentence}
    price            {3000}
    category_id      {Faker::Number.between(from: 1, to: 5)}
    area_id          {Faker::Number.between(from: 1, to: 5)}
    day_id           {Faker::Number.between(from: 1, to: 3)}
    delivery_fee_id  {Faker::Number.between(from: 1, to: 2)}
    status_id        {Faker::Number.between(from: 1, to: 5)}
    created_at       {Faker::Date.in_date_period}
    updated_at       {Faker::Date.in_date_period}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
