class ReservationController < ApplicationController
  before_action :set_pool, only: %i[create]

  def index
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params_reservation)
    @reservation.user = current_user  #current_user
    @reservation.pool = @pool
    @reservation.save
  end

  def edit
  end

  def update
  end

  def show
  end

  def delete
  end

  private

  def set_pool
    @pool = Pool.find(params[:pool_id])
  end


  def params_reservation
    parmas.require(:reservation).permit(:start_date, :end_date, :deposit, :owner_acceptation)
  end
end
