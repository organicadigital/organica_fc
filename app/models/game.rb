class Game < ActiveRecord::Base

  belongs_to :home_player, class_name: "Player"
  belongs_to :away_player, class_name: "Player"

  validates :home_player_id, :away_player_id, presence: true
  validates :home_player_id, uniqueness: {scope: :away_player_id}
  validate :check_players

  after_create :update_score

  def check_players
    if home_player_id == away_player_id
      errors.add :home_player_id, I18n.t("errors.messages.is_equal")
    end
  end

  private
    def update_score
      ScoreTable.update self
    end
end