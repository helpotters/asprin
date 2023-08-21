class FriendRequestsController < ApplicationController
  def create
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
    p @friend_request.user
    p @friend_request.requested_friend
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
