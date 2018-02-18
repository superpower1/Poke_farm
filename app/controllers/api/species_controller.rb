class Api::SpeciesController < ApplicationController
	# def api_index
	def show
		 @specie = Species.find_by(identifier: params[:identifier])
		 @species_chain_id = @specie.evolution_chain_id
		 @species = Species.where(evolution_chain_id: @species_chain_id)
		 # @specie_habitat = Species_habitats_relationship.find_by(species_id: @specie.id)
     # @habitat = Habitat.find(@specie_habitat.habitat_id)
		 # list = []
		 # @species.each do |s|
			#  list << {
			# 	 color: s.color,
			# 	 habitat: s.habitat
			#  }
		 # end

		 # render json: list
		 render json: @species, methods: [:habitat]
		 # render json: @habitat
	end
end