class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    Friendship.create(:inviter_id => current_user.id, :accepter_id => params[:friend_id].to_i, :status => "added")
    Friendship.create(:inviter_id => params[:friend_id].to_i, :accepter_id => current_user.id, :status => "pending")

    redirect_to root_url
  end

  def accept
    @friend = User.find(params[:friend_id])
    @pending_friendship = current_user.pending_friendships.where(:accepter_id => params[:friend_id])
    if @pending_friendship
      @pending_friendship.update(:status => "accepted")
      @added_friendship = @friend.added_friendships.where(:inviter_id => @friend.id)
      @added_friendship.update(:status => "accepted")
    end

    redirect_to root_url
  end

  def destroy
    @friendship = Friendship.where(:inviter_id => current_user.id, :accepter => params[:friend_id]).first
    @friendship.destroy
    @inverse_friendship = Friendship.where(:inviter_id => params[:friend_id], :accepter => current_user.id).first
    @inverse_friendship.destroy

    redirect_to root_url
  end

end
