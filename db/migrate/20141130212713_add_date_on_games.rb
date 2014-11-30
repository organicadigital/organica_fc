class AddDateOnGames < ActiveRecord::Migration
  def change
    add_column :games, :game_date, :date
    Game.find_each do |g|
      g.update_attributes game_date: g.updated_at
    end
  end
end
