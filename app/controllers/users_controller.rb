class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @bike = Bike.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users"

    else
      render "users/show"
    end
  end

  def show
    @user = User.find(params[:id])
    @cohort_list = @user.memberships

  end
  

private

def user_params
  params.require(:user).permit(:name)
end
end
