class AddDestinationToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :destination, :integer
  end
end
