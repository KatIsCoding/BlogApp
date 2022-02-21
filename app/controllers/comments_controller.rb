class CommentsController < ApplicationController
  def new; end

  def create
    @current_user = UsersController.current_user
    comment_params = params.permit(:text)
    @post = Post.find(params[:id])
    @comment = @post.comments.new(text: comment_params[:text], author: @current_user)
    puts "PARAMETERS:-------- #{params}"
    new
    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_url(@current_user, @post), notice: 'Comment was successfully created.' }
      else
        redirect_to user_post_path(@post.author, @post)
      end
    end
  end
end
