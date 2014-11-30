class AddTeamInfosOnScores < ActiveRecord::Migration
  def change
    add_column :scores, :team_name, :string
    add_column :scores, :team_logo, :string

    change_column_null :scores, :team_name, false
  end
end
