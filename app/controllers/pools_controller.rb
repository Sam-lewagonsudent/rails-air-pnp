class PoolsController < ApplicationController
  before_action :set_pool, only: %i[show edit update destroy]
  def index
    @pools = Pool.all
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
     if @pool.save
      redirect_to pool_path(@pool)
     else
      render :new, status: :unprocessable_entity
     end
  end

  def edit
  end

  def update
    if @pool.update(pool_params)
      redirect_to @pool
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @pool.destroy
    redirect_to(@pool)
  end

  private

  def set_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:price, :address, :description, :length, :width, :depth, :shape, :facilities, :photo)
  end
end
