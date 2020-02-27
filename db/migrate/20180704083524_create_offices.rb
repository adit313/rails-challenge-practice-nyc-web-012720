class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.integer :building_id
      t.integer :company_id
      t.integer :floor
      t.timestamps
    end
  end
end
