class Game < ActiveRecord::Base

  belongs_to :championship
  belongs_to :home_score, class_name: "Score"
  belongs_to :away_score, class_name: "Score"

  validates :home_score_id, :championship_id, :away_score_id, presence: true
  validates :home_score_id, uniqueness: {scope: :away_score_id}
  validates :home_goals, :away_goals, numericality: {only_integer: true,
                                                     greater_than_or_equal_to: 0},
                                      on: :update

  # validates :game_date, presence: true, on: :update
  validate :check_players

  after_update :update_score

  scope :ordered, -> { order(created_at: :asc) }
  scope :realized, -> { where("game_date is not null") }

  def check_players
    if home_score_id == away_score_id
      errors.add :home_score_id, I18n.t("errors.messages.is_equal")
    end
  end

  def realized?
    game_date.present?
  end

  delegate :team_name, :team_logo, to: :home_score, prefix: :home, allow_nil: true
  delegate :team_name, :team_logo, to: :away_score, prefix: :away, allow_nil: true

  private
    def update_score
      # ScoreTable.update self.home_score
      # ScoreTable.update self.away_score
    end
end