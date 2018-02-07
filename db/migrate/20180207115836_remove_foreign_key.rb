class RemoveForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key "my_pokemons", "teams"
  end
end
