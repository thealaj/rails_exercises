class BikesController < ApplicationController

  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to "/users/#{@bike.user_id}"
    else
      @user = User.find(@bike.user_id)
      @bikes = @user.bikes
      render 'users/show'
  end
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to root_path
  end

  private
  def bike_params
    params.require(:bike).permit(:color, :user_id)
  end
end
