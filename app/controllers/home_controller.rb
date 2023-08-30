class HomeController < ApplicationController
  def index
    @friends = current_user.friends.all
    @posts = Post.where(user_id: @friends).or(Post.where(user_id: current_user)).order(created_at: :desc)
  end
end
