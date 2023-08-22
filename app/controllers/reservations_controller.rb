class ReservationsController < ApplicationController
  before_action :set_pool, only: %i[create]
  # before action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = Reservation.where(users_id: current_user.id)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params_reservation)
    @reservation.user = current_user  #current_user
    @reservation.pool = @pool
    if @reservation.save
      redirect_to pool_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end


  def edit
  end

  def update
    if @reservation.update(params_reservation)
      redirect_to @reservation, notice: "reservation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @reservation.destroy
    redirect_to pool_path, notice: "reservation was successfully destroyed."
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_pool
    @pool = Pool.find(params[:pool_id])
  end


  def params_reservation
    parmas.require(:reservation).permit(:start_date, :end_date, :deposit, :owner_acceptation)
  end
end
