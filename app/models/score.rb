class Score < ActiveRecord::Base
  belongs_to :championship
  has_and_belongs_to_many :players

  has_many :home_games, class_name: "Game", foreign_key: :home_score_id
  has_many :away_games, class_name: "Game", foreign_key: :away_score_id

  validates :team_name, :championship_id, presence: true

  scope :sorted, lambda { order(points: :desc, wins: :desc)
                          .order("(gp - gc) desc")
                          .order(gp: :desc) }

  after_create :generate_games_table

  def sg
    @sg ||= gp - gc
  end

  def wins_percent
    @wins_percent ||= if games > 0
      100 * (points.to_f / (games.to_f * 3 ))
    else
      0
    end
  end

  private
    def generate_games_table
      GamesTable.generate self
    end
end