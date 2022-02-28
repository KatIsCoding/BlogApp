class UsersController < ApplicationController
  def index; end

  def show
    @user_id = params[:id]
    @user = User.find(@user_id)
  end
end
