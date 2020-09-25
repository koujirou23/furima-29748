FactoryBot.define do
  factory :item do
    name             {'商品名が入ります1aア２'}
    text             {Faker::Lorem.sentence}
    price            {3000}
    category_id      {1}
    area_id          {1}
    day_id           {1}
    delivery_fee_id  {1}
    status_id        {1}
    created_at       {Faker::Date.in_date_period}
    updated_at       {Faker::Date.in_date_period}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
