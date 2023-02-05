class HomeController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @post = Post.new
  end
end
