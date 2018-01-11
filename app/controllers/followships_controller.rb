class FollowshipsController < ApplicationController

  def create
    @followship = current_user.followships.new(following_id: params[:following_id])
    @user = User.find(params[:following_id])
    if @followship.save
    else
      flash[:alert] = @followship.errors.full_messages.to_sentence
    end
  end

  def destroy
    @user = User.find(params[:id])
    @followship = current_user.followships.where(following_id: params[:id])
    @followship.destroy_all
  end
end
