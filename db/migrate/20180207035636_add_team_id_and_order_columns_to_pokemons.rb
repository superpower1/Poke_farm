class AddTeamIdAndOrderColumnsToPokemons < ActiveRecord::Migration[5.1]
  def change
    add_reference :my_pokemons, :team, foreign_key: true
    add_column :my_pokemons, :team_order, :integer
  end
end
