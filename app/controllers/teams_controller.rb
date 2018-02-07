class TeamsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@teams = Team.where(user_id: session[:user_id])
	end

	def update
		@team = Team.find_by(id:params[:id])
		@team.name = params[:name]
		@team.member_1 = params[:member_1]
		@team.member_2 = params[:member_2]
		@team.member_3 = params[:member_3]
		@team.member_4 = params[:member_4]
		@team.member_5 = params[:member_5]
		@team.save
		render :json => @team
	end

	def create
		new_team = Team.new
		new_team.user_id = session[:user_id]
		new_team.save
		redirect_to "/teams"
	end

	def get_user_team_api
		teams = User.find_by(id:params[:name]).teams
		@team_data = {}
		teams.each do |team|
			tmpData = []
			team.pokemons.each do |pokemon|
				tmpData.push(pokemon)
			end
			@team_data[team.name]=tmpData
		end


		render :json => @team_data
	end
end
