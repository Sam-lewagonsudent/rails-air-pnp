class Pool < ApplicationRecord
  belongs_to :users
  has_many :reservations


  validates price:, presence: true, numericality: { greater_than: 0 }
  validates address:, presence: true, length: { maximum: 100 }
  validates description:, presence: true, length: { maximum: 500 }
  validates lenght:, prensence: true, numericality: { greater_than: 0 }
  validates width:, presence: true, numericality: { greater_than: 0 }
  validates depth:, presence: true, numericality: { greater_than: 0 }
  validates shape:, presence: true, length: { maximum: 50 }
  validates facilities:, presence: true, length: { maximum: 100 }

  has_one_attached :photo
end
