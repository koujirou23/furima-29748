class UserPurchase
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :city, :road, :building, :phone, :token, :user_id, :item_id

  validates :city, :road, :token, presence: true

  with_options presence: true do
    validates :area_id, numericality: { other_than: 0, message: 'Select' }
    validates :phone, format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' }
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, area_id: area_id, city: city, road: road, building: building, phone: phone, purchase_id: purchase.id)
  end
end
