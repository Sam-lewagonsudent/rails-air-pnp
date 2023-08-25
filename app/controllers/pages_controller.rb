class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      @reservations = []
      Pool.where(user_id: current_user.id).each do |pool|
        Reservation.where(pool_id: pool.id).each do |reservation|
          @reservations << reservation if pool.user_id == current_user.id && reservation.owner_acceptation == false
        end
      end
    end
  end
end
