class Address < ApplicationRecord

  belongs_to_active_hash :area

  validates :postcode, :area, :city, :road, :phone, presence: true
  validates :area_id { other_than: 0, message: 'Select' }

  belongs_to :purchase
end
