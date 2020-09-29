class Address < ApplicationRecord

  belongs_to_active_hash :area

  validates :postcode, :area, :city, :road, :phone, presence: true
  validates :area_id { other_than: 0, message: 'Select' }
  validates :phone, format: { with: ^0\d message: "number is invalid. Include half-width numbers "} 
  validates :postcode, format: { with: ^\d{3}-\d{4} "is invalid. Include hyphen(-)" }

  belongs_to :purchase
end
