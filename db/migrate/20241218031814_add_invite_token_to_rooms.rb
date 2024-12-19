class AddInviteTokenToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :invite_token, :string
    add_index :rooms, :invite_token, unique: true
  end
end
