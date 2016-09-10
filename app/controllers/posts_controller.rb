class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
