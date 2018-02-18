class UsersController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if !user
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.ball = 5
    user.money = 1000

      if user.save
        session[:user_id] = user.id
        User.create_user_pokemon(session[:user_id])
        redirect_to '/my_pokemons'
      else
        render '/users/new'
      end
    else
      render '/pages/home'
    end
  end

  def login
     user = User.find_by(email: params[:email])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
        redirect_to '/my_pokemons'
     else
        render '/pages/home'
     end
  end

  def show
   @user = User.find(params[:id])
  end
end
