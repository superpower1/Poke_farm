class HabitatsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
  def index
    @habitats = Habitat.all
    @teams = Team.all
  end

  def get_catched_pokemon_api
  	# pokemon in the team can improve capture_rate
  	# byebug
  	@team = Team.find_by(id: params[:team_id]).pokemons

  	effect = 0
  	@team.each do |pokemon|
  		effect_level = Species.find_by(id:pokemon.species_id).capture_rate
  		effect += pokemon.level*(255 - effect_level+1)/255.0/100
  	end

  	helper_effect = 1.0 + effect

		loop do 
			# find pokemon base on rarity
			species = Habitat.find_by(id:params[:destination]).species
			@the_chosen_one = species[rand(species.length)]

			# rarity is in the range of 1-255
			rarity = (@the_chosen_one.capture_rate * helper_effect).ceil 
			random_num = rand(255)
			break if random_num <= rarity
		end 

		# stop timer
		update_team = Team.find_by(id: params[:team_id])
		update_team.start_time = nil
		update_team.save

		# store pokemon to mypokemon table
		new_pokemon = MyPokemon.new
		new_pokemon.species_id = @the_chosen_one.id
		new_pokemon.nickname = @the_chosen_one.identifier
		new_pokemon.level = rand(10)
		new_pokemon.exp = 0
		new_pokemon.user_id = session[:user_id]
		new_pokemon.growth_rate = @the_chosen_one.growth_rate
		new_pokemon.save

		render :json => @the_chosen_one
		# render :json => @effect
	end

	def start_catch_pokemon_api
		@team = Team.find_by(id:params[:team_id])
		@team.start_time = Time.now.utc
		@team.destination = params[:destination].to_i
		@team.save
		render :json => @team
	end
end
