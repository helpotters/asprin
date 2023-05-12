class HomeController < ApplicationController
  def index
    p current_user.friends.all
    @friends = current_user.friends.all
    @posts = current_user.posts.all.reverse
  end
end
