class Purchase < ApplicationRecord
  attr_accessor :token
  validates :token, presence: true
  has_one :address
  belongs_to :item
  belongs_to :user
end
