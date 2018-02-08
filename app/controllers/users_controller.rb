class UsersController < ApplicationController
  def new

  end

  def create
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.ball = 5
    user.money = 1000

    # arr = [1,3,5]
    # Shop.delete_all
    # arr.each do |num|
    # shop = Shop.new
    # shop.name = Species.find(num).identifier
    # shop.price = 100
    # shop.img_url = Species.find(num).img_url
    # shop.save
    end

    if user.save
      session[:user_id] = user.id
      redirect_to '/my_pokemons'
    else
      render '/users/new'
    end
  end

  def show
   @user = User.find(params[:id])
  end
end
