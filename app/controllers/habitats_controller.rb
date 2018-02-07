class HabitatsController < ApplicationController
  def index
    @habitats = Habitat.all
    @teams = Team.all
  end
end
