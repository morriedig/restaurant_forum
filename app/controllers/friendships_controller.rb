class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])
    @user = User.find(params[:friend_id])
    @friendship.comfirm = false
    @friendship.save
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.add?(@user)
      @friendship = current_user.friendships.where(friend_id: params[:id])
    else
      @friendship = @user.friendships.where(friend_id: current_user.id)
    end
    @friendship.destroy_all
  end

  def update
    @user = User.find(params[:id])
    @friendship = @user.friendships.where(friend_id: current_user.id).first
    @friendship.comfirm = true
    @friendship.save
  end

end
