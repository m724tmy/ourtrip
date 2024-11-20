class CreateScheduleLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :schedule_locations do |t|
      t.references :schedule, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.timestamps
    end
  end
end
