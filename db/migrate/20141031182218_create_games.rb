class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :home_player, null: false
      t.belongs_to :away_player, null: false

      t.integer :home_goals, default: 0
      t.integer :away_goals, default: 0

      t.timestamps
    end

    add_index :games, [:home_player_id, :away_player_id], unique: true
  end
end
