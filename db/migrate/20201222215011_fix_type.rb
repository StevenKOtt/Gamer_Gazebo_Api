class FixType < ActiveRecord::Migration[6.1]
  def change
    rename_column :game_cards, :type, :product
  end
end
