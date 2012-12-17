class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.belongs_to :player
      t.belongs_to :assignment

      t.timestamps
    end

    add_index :achievements, [:player_id, :assignment_id], :unique => true
  end
end
