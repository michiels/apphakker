class AddAssignmentSetIdToAssignments < ActiveRecord::Migration
  def change
    change_table :assignments do |t|
      t.belongs_to :assignment_set
    end
  end
end
