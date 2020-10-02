FactoryBot.define do
  factory :user_purchase do
    token     { 'tok_abcdefghijk00000000000000000' }
    postcode  { '123-4567' }
    area_id   { 1 }
    city      { '横浜' }
    road      { '横浜市' }
    phone     { '09012345678' }
    user_id   { 1 }
    item_id   { 1 }
  end
end
