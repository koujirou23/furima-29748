class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  validates :name, :text, :category, :status, :delivery_fee, :area, :day, :price, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, numericality: { other_than: 0 }
  validates :price, format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_one_attached :image
end
