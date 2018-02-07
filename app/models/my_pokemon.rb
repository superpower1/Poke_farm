class MyPokemon < ApplicationRecord
  belongs_to :species
  belongs_to :user
  belongs_to :team, optional: true
end
