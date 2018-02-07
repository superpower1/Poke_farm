class User < ApplicationRecord
  has_many :my_pokemons
  has_many :teams
  has_secure_password
end
