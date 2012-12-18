class CreateAssignmentSets < ActiveRecord::Migration
  def change
    create_table :assignment_sets do |t|
      t.belongs_to :next_set_id
      t.string :name
      t.string :alias, :unique => true

      t.timestamps
    end
  end
end
