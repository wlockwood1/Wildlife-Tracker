class ChangeLatAndLongDataAgain < ActiveRecord::Migration
  def change
    change_table :sightings do |t|
      t.change :latitude, :decimal
      t.change :longitude, :decimal
    end
  end
end
