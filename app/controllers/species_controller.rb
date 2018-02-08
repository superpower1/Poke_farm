class SpeciesController < ApplicationController
	def index
		 # @species = Species.all
		 @species = Species.paginate(:page => params[:page], :per_page => 10)
	end

	def show
		@identify_species = Species.where("identifier LIKE ?", "%#{params[:identifier]}%")
		if params[:fuzzy_search]
			render :json => @identify_species
			return
		end
		render :json => @specie
	end

	def api_index
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
