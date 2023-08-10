class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    p @post
    render turbo_stream: turbo_stream.replace(
      "post_#{params[:id]}",
      partial: 'posts/edit',
      locals: { post: @post }
    )
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove("post_#{params[:id]}") }
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render turbo_stream: turbo_stream.replace(
        "edit_post_#{params[:id]}",
        partial: 'posts/post',
        locals: { post: @post }
      )
    else
      render turbo_stream: turbo_stream.replace(
        "edit_post_#{params[:id]}",
        partial: 'posts/edit',
        locals: { post: @post }
      )
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_text, :user_id)
  end
end
