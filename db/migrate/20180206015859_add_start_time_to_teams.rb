class AddStartTimeToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :start_time, :string
  end
end
