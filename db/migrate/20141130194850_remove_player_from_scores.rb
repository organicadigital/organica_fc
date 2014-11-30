class RemovePlayerFromScores < ActiveRecord::Migration
  def change
    remove_column :scores, :player_id
  end
end
