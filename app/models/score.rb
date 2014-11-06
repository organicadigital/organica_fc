class Score < ActiveRecord::Base
  belongs_to :player

  validates :player_id, presence: true

  scope :sorted, lambda { order(points: :desc, wins: :desc)
                          .order("(gp - gc) desc")
                          .order(gp: :desc) }

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
end