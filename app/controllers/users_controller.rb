class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @bike = Bike.new #don't forget this!
    @user = User.find(params[:id])
    @bikes = @user.bikes #helper method
    # @bikes = Bike.where(user_id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
