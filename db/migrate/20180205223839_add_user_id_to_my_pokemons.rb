class AddUserIdToMyPokemons < ActiveRecord::Migration[5.1]
  def change
    add_column :my_pokemons, :user_id, :integer
  end
end
