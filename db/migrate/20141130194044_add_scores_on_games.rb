class AddScoresOnGames < ActiveRecord::Migration
  def change
    add_column :games, :home_score_id, :integer
    add_column :games, :away_score_id, :integer

    change_column_null :games, :home_score_id, false
    change_column_null :games, :away_score_id, false

    add_index :games, [:home_score_id, :away_score_id], unique: true

    remove_column :games, :home_player_id
    remove_column :games, :away_player_id
  end
end
