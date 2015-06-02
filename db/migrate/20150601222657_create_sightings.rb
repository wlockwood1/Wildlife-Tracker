class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.references :animal
      t.integer :animal_id
      t.date :date
      t.integer :latitude
      t.integer :longitude
      t.timestamps null: false
    end
  end
end
