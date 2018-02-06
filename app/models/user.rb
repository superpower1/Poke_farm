class User < ApplicationRecord
  has_many :my_pokemons
  has_secure_password
end
