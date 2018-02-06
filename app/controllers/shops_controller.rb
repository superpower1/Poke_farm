class ShopsController < ApplicationController

	def index
		@shops = Shop.all
		# @pokemons = MyPokemon.find(params[:id])
	end


end
