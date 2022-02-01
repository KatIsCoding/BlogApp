class UsersController < ApplicationController
  def index
  end
  def show
    puts "This are the params: " + params.to_s
    @userId =params[:id]
    puts @userId
  end
end
