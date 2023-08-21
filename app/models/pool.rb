class Pool < ApplicationRecord
  belongs_to :user

  validates :price, :address, :description, :length, :width, :depth, :shape, presence: true
end
