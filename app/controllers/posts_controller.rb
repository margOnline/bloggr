class PostsController < ApplicationController
  def index
    @posts = Post.descending_chronologically
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Message posted'
      redirect_to root_url
    else
      error_message = @post.errors.full_messages.join("\n")
      flash[:error] = error_message
      redirect_to root_url
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Message deleted'
    redirect_to root_url
  end

  private
  def post_params
    params.require(:post).permit(:message)
  end
end
