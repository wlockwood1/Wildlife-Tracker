class ChangeLatAndLongDataType < ActiveRecord::Migration
  def change
    change_table :sightings do |t|
      t.change :latitude, :real
      t.change :longitude, :real
    end
  end
end
