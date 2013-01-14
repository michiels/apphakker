class AddProjectFieldsToPlayer < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.text :app_idea
      t.string :git_repository_url
    end
  end
end
