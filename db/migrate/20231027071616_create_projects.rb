class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :role
      t.string :repo
      t.string :live
      t.string :description
      t.string :feature1
      t.string :feature2
      t.string :feature3
      t.string :feature4

      t.timestamps
    end
  end
end
