class LikesController < ApplicationController
  def new; end

  def create
    puts "PARAMETERS:-------- #{params}"
    current_user = UsersController.current_user
    like_parameters = params.require(:like).permit(:post_id)
    @post = Post.find(like_parameters[:post_id])
    @like = Like.new(post: @post, author: current_user)
    respond_to do |format|
      format.js { render inline: 'location.reload();' } if @like.save
    end
  end
end
