class CommentsController < ApplicationController
  def new; end

  def destroy 
    @comment_to_delete = Comment.find(params[:comment_id])
    @comment_to_delete.destroy
    @comment_to_delete.post.update(commentscounter: @comment_to_delete.post.commentscounter - 1)
    respond_to do |format|
      format.html { redirect_to user_post_url(@comment_to_delete.post.author, @comment_to_delete.post), notice: 'Comment was successfully deleted.' }
      format.js
    end
  end
  def create
    @current_user = current_user
    comment_params = params.permit(:text)
    @post = Post.find(params[:id])
    @comment = @post.comments.new(text: comment_params[:text], author: @current_user)
    new
    respond_to do |format|
      if @comment.valid?
        @comment.save
        format.html { redirect_to user_post_url(@current_user, @post), notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to user_posts_path(@post.author), notice: 'Comment was not created.' }
      end
    end
  end
end
