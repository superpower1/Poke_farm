class Api::TeamsController < ApplicationController
	skip_before_action :verify_authenticity_token
	# def get_user_team_api
	def index
		teams = User.find_by(id:params[:name]).teams
		@team_data = {}
		teams.each do |team|
			tmpData = {
				id: team.id,
				name: team.name,
				start_time: team.start_time,
				pokemons: [],
				destination: team.destination,
				destinationName: Habitat.find_by(id: team.destination)
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