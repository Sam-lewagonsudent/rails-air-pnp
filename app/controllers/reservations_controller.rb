class ReservationsController < ApplicationController
  before_action :set_pool, only: %i[create new index]
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params_reservation)
    @reservation.deposit = false
    @reservation.owner_acceptation = false
    @reservation.user = current_user
    @reservation.pool = @pool
    if @reservation.save
      redirect_to pool_path(@pool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
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

  def destroy
    redirect_to root_path, notice: 'Deleted', status: :see_other if @reservation.destroy
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_pool
    @pool = Pool.find(params[:pool_id])
  end

  def params_reservation
    params.require(:reservation).permit(:start_date, :end_date, :deposit, :owner_acceptation)
  end
end
