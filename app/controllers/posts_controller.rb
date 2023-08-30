class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    render turbo_stream: turbo_stream.replace(
      "post_#{params[:id]}",
      partial: "posts/edit",
      locals: { post: @post },
    )
  end

  def index
    @user = current_user
    @posts = Post.where(user_id: @user.friends).or(Post.where(user_id: @user))
  end

  def create
    @post = Post.create(post_params)

    respond_to do |format|
      format.turbo_stream do
        turbo_stream_prepend("posts", PostComponent.new(post: @post))
        turbo_stream_prepend("flash", FlashComponent.new(type: :success, message: "Your post is now on the feed."))
        turbo_stream_replace("post_form", PostFormComponent.new(user: current_user))
        render turbo_stream: actions
      end
      format.html { redirect_to authenticated_root_path }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.turbo_stream do
        turbo_stream_remove("post_#{params[:id]}")
        turbo_stream_prepend("flash", FlashComponent.new(type: :info, message: "Post has been deleted."))
        render turbo_stream: actions
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_text, :user_id)
  end
end
