class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :route
      t.string :station_name
      t.integer :walk_time
      t.timestamps
    end
  end
end
