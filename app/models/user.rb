class User < ApplicationRecord
  has_many :my_pokemons
  has_many :teams
  has_secure_password

  def self.create_user_pokemon(session)
    newpokemons = [
      {
      species_id: 1,
      nickname: "frank",
      level: 1,
      exp: 0,
      growth_rate: "medium-slow"
      },
      {
      species_id: 4,
      nickname: 'charm',
      level: 1,
      exp: 0,
      growth_rate: "medium-slow"
      },
      {
      species_id: 7,
      nickname: 'tin',
      level: 1,
      exp: 0,
      growth_rate: "medium-slow"
      }
    ]

      newpokemons.each do |poke|
        mypokemon = MyPokemon.new
        mypokemon.species_id = poke[:species_id]
        mypokemon.nickname = poke[:nickname]
        mypokemon.level = poke[:level]
        mypokemon.exp = poke[:exp]
        mypokemon.growth_rate = poke[:growth_rate]
        mypokemon.user_id = session
        mypokemon.save
      end

  end


end
