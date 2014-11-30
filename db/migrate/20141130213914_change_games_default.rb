class ChangeGamesDefault < ActiveRecord::Migration
  def change
    change_column_default :games, :home_goals, nil
    change_column_default :games, :away_goals, nil
  end
end
