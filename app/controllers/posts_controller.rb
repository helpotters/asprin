class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = current_user.posts.all.reverse
  end

  def create
    @post = Post.create(post_params)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.prepend(:posts,
                                                  partial: 'posts/post',
                                                  locals: { post: @post })
      end
      format.html { redirect_to authenticated_root_path }
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_text, :user_id)
  end
end
