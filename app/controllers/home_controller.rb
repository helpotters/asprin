class HomeController < ApplicationController
  def index
    @posts = current_user.posts.all.reverse
  end
end
