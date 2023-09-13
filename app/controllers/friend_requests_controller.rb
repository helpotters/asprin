class FriendRequestsController < ApplicationController
  def create
    @requested_friend = User.find(params[:id])

    FriendRequest.create(user: current_user, requested_friend: @requested_friend) unless current_user.friends_with?(@requested_friend)
    FriendRequest.create(user: @requested_friend, requested_friend: current_user) unless @requested_friend.friends_with?(user)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: remove_request }
      format.html { redirect_to show_profile_path(params[:id]) }
    end
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: remove_request }
      format.html { redirect_to authenticated_root_path }
    end
  end

  def update
    @friend_request = FriendRequest.find(params[:id])
    Friendship.create(friend: @friend_request.user, user: @friend_request.requested_friend)
    @friend_request.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: remove_request }
      format.html { redirect_to authenticated_root_path, notice: "friend_request was successfully destroyed. #{params[:id]}" }
    end
  end

  private

  def friend_request_params
    params.permit(:user_id, :requested_friend_id)
  end

  def remove_request
    turbo_stream.remove("notif_#{params[:id]}")
  end
end
