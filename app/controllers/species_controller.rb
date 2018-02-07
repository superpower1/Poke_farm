class SpeciesController < ApplicationController
	def index
		 # @species = Species.all
		 @species = Species.paginate(:page => params[:page], :per_page => 10)
	end

	# def show
	# 	@identify_species = Species.where("identifier LIKE ?", "%#{params[:identifier]}%")
	# 	if params[:fuzzy_search]
	# 		render :json => @identify_species
	# 		return
	# 	end
	# 	render :json => @specie
	# end

	def api_index
		 @specie = Species.find_by(identifier: params[:identifier])
		 @species_chain_id = @specie.evolution_chain_id
		 @species = Species.where(evolution_chain_id: @species_chain_id)
		 render json: @species
	end
end
