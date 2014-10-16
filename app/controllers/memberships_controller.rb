class MembershipsController < ApplicationController

  def create
    membership = Membership.new(membership_params)
    membership.cohort_id = params[:id]
    membership.save
    redirect_to "/cohorts/#{params[:id]}"
  end

  def destroy
    membership = Membership.find_by(user_id: params[:id])
    temp_cohort_id = membership.cohort_id #because the membership is about to be destroyed
    membership.destroy

    redirect_to "/cohorts/#{temp_cohort_id}"
  end

  private
  def membership_params
    params.require(:membership).permit(:user_id, :cohort_id, :role)
  end
end
