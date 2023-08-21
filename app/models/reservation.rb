class Reservation < ApplicationRecord
  belong_to :pools
  belong_to :users

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :deposit, presence: true, default: false
  validates :owner_acceptation, presence: true, default: false
end
