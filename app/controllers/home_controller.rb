class HomeController < ApplicationController
  def index
    @friends = current_user.friends.all
    @posts = current_user.posts.all.reverse
    @results = []
  end
end
