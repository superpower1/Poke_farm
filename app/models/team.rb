class Team < ApplicationRecord
	has_many :pokemons, class_name: 'MyPokemon'
	belongs_to :user
end
