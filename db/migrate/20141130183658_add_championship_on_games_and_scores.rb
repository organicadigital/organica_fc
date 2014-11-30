class AddChampionshipOnGamesAndScores < ActiveRecord::Migration
  def change
    championship = Championship.create! name: "1º Campeonado da Orgânica"

    add_column :games, :championship_id, :integer, after: :id
    Game.update_all championship_id: championship.id

    change_column_null :games, :championship_id, false

    add_column :scores, :championship_id, :integer, after: :id
    Score.update_all championship_id: championship.id

    change_column_null :scores, :championship_id, false
  end
end
