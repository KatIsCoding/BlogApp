class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
    
    @user = User.find(@user_id)
    @post = Post.find(@post_id)
  end
end
