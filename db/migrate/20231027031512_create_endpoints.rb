class CreateEndpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :endpoints do |t|
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
