class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :company
      t.string :start_date
      t.string :end_date
      t.string :responsibility1
      t.string :responsibility2
      t.string :responsibility3

      t.timestamps
    end
  end
end
