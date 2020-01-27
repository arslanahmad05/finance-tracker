class FriendshipsController < ApplicationController
  def create
    current_user.friendships.build(friend_id: params[:friend])
    if current_user.save
      flash[:notice] = "Following User "
    else
      flash[:alert] = "There is some thing qrong "
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Stoped Following"
    redirect_to my_friends_path
  end
end
