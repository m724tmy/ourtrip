class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_name, null: false
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
