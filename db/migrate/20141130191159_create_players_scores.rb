class CreatePlayersScores < ActiveRecord::Migration
  def change
    create_table :players_scores do |t|
      t.belongs_to :player, null: false
      t.belongs_to :score, null: false
      t.timestamps
    end

    add_index :players_scores, [:player_id, :score_id], unique: true

    Score.find_each do |s|
      s.players = [s.player]

      s.save!
    end
  end
end
