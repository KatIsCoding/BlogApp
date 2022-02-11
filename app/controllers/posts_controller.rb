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

  def create
    Post.create(author: UsersController.current_user, title: params[:title], text: params[:text])
  end

  def create_comment
    current_post = Post.find(params[:id])
    current_post.comments.create(author: UsersController.current_user, text: params[:text])
  end

  def add_like
    current_post = Post.find(params[:id])
    Like.create(author: UsersController.current_user, post: current_post)
  end
end
