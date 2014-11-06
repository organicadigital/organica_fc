class Score < ActiveRecord::Base
  belongs_to :player

  validates :player_id, presence: true

  scope :sorted, lambda { order(points: :desc, wins: :desc)
                          .order("(gp - gc) desc")
                          .order(gp: :desc) }

  def sg
    @sg ||= gp - gc
  end
end