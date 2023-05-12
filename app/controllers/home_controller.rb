class HomeController < ApplicationController
  def index
    @posts = current_user.posts.all.reverse
    @friends = current_user.friends.all
  end
end
