class FriendshipsController < ApplicationController
  def destroy
  end

  def update
  end

  def create
    p @notif
    Friendship.create(user: @notif.user, friend: @notif.friend)
    @friend_request = FriendRequest.find(@notif.id)
    @friend_request.destroy
    respond_to do |format|
      format.html { redirect_to authenticated_root_path, notice: 'friend_request was successfully destroyed.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove("notif_#{params[:id]}") }
    end
  end

  def new
  end
end
