class HabitatsController < ApplicationController
  def index
    @habitats = Habitat.all
    @teams = Team.all
  end

  def get_catched_pokemon_api

  	# pokemon in the team can improve capture_rate
  	@team = Team.find_by(id:params[:team_id]).pokemons

  	effect = 0
  	@team.each do |pokemon|
  		effect_level = Species.find_by(id:pokemon.species_id).capture_rate
  		effect += pokemon.level*(255 - effect_level+1)/255.0/100
  	end

  	helper_effect = 1.0 + effect

		loop do 
			# find pokemon base on rarity
			species = Habitat.find_by(id:params[:id]).species
			@the_chosen_one = species[rand(species.length)]

			# rarity is in the range of 1-255
			rarity = (@the_chosen_one.capture_rate * helper_effect).ceil 
			random_num = rand(255)
			break if random_num <= rarity
		end 

		render :json => @the_chosen_one
		# render :json => @effect
	end
end
