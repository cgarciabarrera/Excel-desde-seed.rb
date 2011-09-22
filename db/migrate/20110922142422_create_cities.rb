class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :country_id
      t.integer :stete_id
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
