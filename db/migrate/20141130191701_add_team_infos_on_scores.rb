class AddTeamInfosOnScores < ActiveRecord::Migration
  def change
    add_column :scores, :team_name, :string
    add_column :scores, :team_logo, :string

    Score.find_each do |s|
      s.team_name = s.player.acronym || s.player.email
      s.team_logo = "http://www.gravatar.com/avatar/#{s.player.email_md5}?s=20&d=wavatar"
      s.save!
    end

    change_column_null :scores, :team_name, false
  end
end
