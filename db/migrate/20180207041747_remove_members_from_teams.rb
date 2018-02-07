class RemoveMembersFromTeams < ActiveRecord::Migration[5.1]
  def change
    remove_column :teams, :member_1, :integer
    remove_column :teams, :member_2, :integer
    remove_column :teams, :member_3, :integer
    remove_column :teams, :member_4, :integer
    remove_column :teams, :member_5, :integer
    remove_column :teams, :member_6, :integer
  end
end

