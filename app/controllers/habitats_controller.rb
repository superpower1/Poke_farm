class HabitatsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
  def index
    @habitats = Habitat.all
    @teams = Team.all
  end
end
