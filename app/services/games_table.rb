class GamesTable
  def self.generate(score)
    new(score).generate
  end

  attr_reader :score
  delegate :championship, to: :score

  def initialize(score)
    @score = score
  end

  def scores
    @scores ||= championship.scores.where("id != ?", score.id).all
  end

  def generate
    ActiveRecord::Base.transaction do
      scores.each do |s|
        create_game score.id, s.id
        create_game s.id, score.id
      end
    end
  end

  private
    def create_game(home_id, away_id)
      championship.games.create(home_score_id: home_id, away_score_id: away_id)
    end
end