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

    newpokemons = [
      {
      species_id: 1,
      nickname: "frank",
      level: 1,
      exp: 0,
      growth_rate: "medium-slow"
      },
      {
      species_id: 4,
      nickname: 'charm',
      level: 1,
      exp: 0,
      growth_rate: "medium-slow"
      },
      {
      species_id: 7,
      nickname: 'tin',
      level: 1,
      exp: 0,
      growth_rate: "medium-slow"
      }
    ]
    if user.save
      session[:user_id] = user.id
      newpokemons.each do |poke|
        mypokemon = MyPokemon.new
        mypokemon.species_id = poke[:species_id]
        mypokemon.nickname = poke[:nickname]
        mypokemon.level = poke[:level]
        mypokemon.exp = poke[:exp]
        mypokemon.growth_rate = poke[:growth_rate]
        mypokemon.user_id = session[:user_id]
        mypokemon.save
      end

      redirect_to '/my_pokemons'
    else
      render '/users/new'
    end
  end


  def show
   @user = User.find(params[:id])
  end
end
