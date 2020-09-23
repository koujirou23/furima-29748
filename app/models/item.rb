class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :area, :status, :delivery_fee, :day

  validates :name, :text, :category, :status, :delivery_fee, :area, :day, :price, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :area_id, :date_id, numericality: { other_than: 1 } 
  
  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
