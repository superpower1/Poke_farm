class ShopsController < ApplicationController

	def index
		@shops = Shop.all
		@pokemon = MyPokemon.find(params[:id])
	end


end
