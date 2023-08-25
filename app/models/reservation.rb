class Reservation < ApplicationRecord
  belongs_to :pool
  belongs_to :user

  validates :owner_acceptation, inclusion: [true, false]
  validates :start_date, presence: true, uniqueness: { scope: :pool_id, message: "Cette piscine est déja reservée!" }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time

  private


  def end_time_after_start_time
    errors.add(:start_time, "must be before end time") if start_time && end_time && start_time >= end_time
  end
end
