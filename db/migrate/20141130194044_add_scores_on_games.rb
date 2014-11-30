class AddScoresOnGames < ActiveRecord::Migration
  def change
    add_column :games, :home_score_id, :integer
    add_column :games, :away_score_id, :integer

    Game.find_each do |g|
      home_score = Score.find_by player_id: g.home_player_id
      away_score = Score.find_by player_id: g.away_player_id

      g.home_score_id = home_score.id
      g.away_score_id = away_score.id

      g.save!
    end

    change_column_null :games, :home_score_id, false
    change_column_null :games, :away_score_id, false

    add_index :games, [:home_score_id, :away_score_id], unique: true

    remove_column :games, :home_player_id
    remove_column :games, :away_player_id
  end
end
