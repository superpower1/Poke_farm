class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :member_1
      t.integer :member_2
      t.integer :member_3
      t.integer :member_4
      t.integer :member_5
      t.integer :member_6

      t.timestamps
    end
  end
end
