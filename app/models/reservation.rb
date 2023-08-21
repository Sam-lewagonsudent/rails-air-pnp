class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pool

  validates :start_date, :end_date, presence: true
  validate :start_date_before_end_date

  private

  def start_date_before_end_date
    errors.add(:start_date, "must be before end date") if start_date && end_date && start_date >= end_date
  end
end
