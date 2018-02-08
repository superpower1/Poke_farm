class ShopsController < ApplicationController

	def index
		@shops = Shop.all
		@pokemons = MyPokemon.where(user_id: session[:user_id])	# change this to session  [:user_id]
		@user = User.find(session[:user_id])   # change this to session  [:user_id]
		@mypokemon = MyPokemon.all


	end

	def create
		@user = User.find(session[:user_id]) # change this to session  [:user_id]
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


		@mypokemon = MyPokemon.new

		redirect_to '/shops'
	end


end
