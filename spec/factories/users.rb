FactoryBot.define do
  factory :user do
    nickname              { 'tanaka' }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_reading     { 'タナカ' }
    first_name_reading    { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end
