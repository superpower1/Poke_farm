class ShopsController < ApplicationController

	def index
		@shops = Shop.all
		@pokemons = MyPokemon.where(user_id: '1')	
		@user = User.find('1')
		@mypokemon = MyPokemon.all
	end

	def create
		@user = User.find('1') # change this to session  [:user_id]
		@mymoney = @user.money
		@actionType = params[:actionType]

		#if actionType is buy
		if @actionType == "buy"
		@totalPrice = params[:totalPrice]
		@mymoney = @mymoney - @totalPrice.to_i
		
		elsif @actionType == "sell"
			
		#if actionType is sell
		@totalIncome = params[:totalIncome]
		@mymoney = @mymoney + @totalIncome.to_i

		end

		@user.money = @mymoney
		@user.save


		redirect_to '/shops'
	end


end
