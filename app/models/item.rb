class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  validates :image, :name, :text, :category, :status, :delivery_fee, :area, :day, :price, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, numericality: { other_than: 0, message: 'Select' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
