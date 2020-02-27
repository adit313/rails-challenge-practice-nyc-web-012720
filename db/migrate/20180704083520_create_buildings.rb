class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :country
      t.string :address
      t.float :rent_per_floor
      t.integer :number_of_floors
      t.timestamps
    end
  end
end
