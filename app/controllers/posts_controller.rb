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

  def new; end

  def create
    # Post.create(author: UsersController.current_user, title: params[:title], text: params[:text])

    @current_user = UsersController.current_user
    post_params = params.require(:post).permit(:title, :text)
    @post = @current_user.posts.new(title: post_params[:title], text: post_params[:text], commentscounter: 0,
                                    likescounter: 0)

    respond_to do |format|
      if @post.valid?
        @post.save
        format.html { redirect_to user_post_url(@current_user, @post), notice: 'Post was successfully created.' }
      else
        format.html do
          redirect_to user_posts_url(@current_user), notice: "Post was not created.#{@post.errors.full_messages}"
        end
      end
    end
  end
end
