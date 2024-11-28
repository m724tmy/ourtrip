class CreateChatHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_histories do |t|
      t.references :room, null: false, foreign_key: true
      t.string :role
      t.text :content

      t.timestamps
    end
  end
end
