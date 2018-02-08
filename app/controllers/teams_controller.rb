class TeamsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@teams = Team.where(user_id: session[:user_id])
		@my_pokemons = MyPokemon.where(user_id: session[:user_id])
	end

	def update
		pokemon = MyPokemon.find_by(id: params[:my_pokemon_id])
		pokemon.team_id = params[:id]
		pokemon.save
		redirect_to '/teams'
	end

	def create
		new_team = Team.new
		new_team.user_id = session[:user_id]
		new_team.name = params[:name]
		new_team.save
		redirect_to "/teams"
	end

	def get_user_team_api
		teams = User.find_by(id:params[:name]).teams
		@team_data = {}
		teams.each do |team|
			tmpData = {
				id: team.id,
				name: team.name, 
				start_time: team.start_time,
				pokemons: [],
				destination: team.destination
			}
			team.pokemons.each do |pokemon|
				tmpData[:pokemons].push(pokemon)
			end
			@team_data[team.id]=tmpData
			# @team_data['name'] = team.name
			# @team_data['start_time'] = team.start_time
		end

		# render :json => @team_data
		render :json => @team_data
	end
end
