class Reservation < ApplicationRecord
  belongs_to :pool
  belongs_to :user

  validates :deposit, inclusion: [true, false]
  validates :owner_acceptation, inclusion: [true, false]
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_before_end_date

  private

  def start_date_before_end_date
    errors.add(:start_date, "must be before end date") if start_date && end_date && start_date >= end_date
  end
end
