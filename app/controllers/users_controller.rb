class UsersController < ApplicationController
  def new

  end

  def create
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    if user.save
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      render '/users/new'
    end
  end

  def show
   @user = User.find(params[:id])
  end
end
