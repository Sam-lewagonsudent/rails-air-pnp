class Pool < ApplicationRecord
  SHAPE = ['round', 'square', 'drop', 'natural']
  FACILITIES = ['BBQ', 'transat', 'ballon', 'umbrella', 'shower']

  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :length, presence: true, numericality: { greater_than: 0 }
  validates :width, presence: true, numericality: { greater_than: 0 }
  validates :depth, presence: true, numericality: { greater_than: 0 }
  validates :shape, presence: true, length: { maximum: 50 }
  validates :facilities, presence: true, length: { maximum: 100 }

  has_one_attached :photo
  validates :photo, presence: true

#   has_one_attached :photo, dependent: :destroy

end
