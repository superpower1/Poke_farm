class Team < ApplicationRecord
	has_many :pokemons, class_name: 'MyPokemon'
end
