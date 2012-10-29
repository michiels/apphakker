class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :ruby_class
      t.string :name

      t.timestamps
    end
  end
end
