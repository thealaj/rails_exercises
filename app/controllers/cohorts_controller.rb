class CohortsController < ApplicationController

  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      redirect_to "/cohorts"
    else
      render "/cohorts"
    end
  end

  def show
    @cohort = Cohort.find(params[:id])
    @users = User.all
    @members = @cohort.users

  end

  private
  def cohort_params
  params.require(:cohort).permit(:name) 
end
end
