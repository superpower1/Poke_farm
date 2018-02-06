class ShopsController < ApplicationController

	def index
		@shops = Shop.all
		@pokemons = MyPokemon.where(user_id: '1')	

	end




end
