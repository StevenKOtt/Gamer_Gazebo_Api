class CreateGameCards < ActiveRecord::Migration[6.1]
  def change
    create_table :game_cards do |t|
      t.string :type
      t.string :screenname
      t.string :currently_playing
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
