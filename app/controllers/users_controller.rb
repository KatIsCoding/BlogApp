class UsersController < ApplicationController
  def index; end

  def show
    puts "This are the params: #{params}"
    @user_id = params[:id]
    puts @userId
  end
end
