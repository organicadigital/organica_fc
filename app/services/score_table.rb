class ScoreTable
  def self.update(score)
    new(score).update
  end

  attr_reader :score

  def initialize(score)
    @score = score
  end

  def home_games
    @home_games = score.home_games.realized.to_a
  end

  def away_games
    @away_games = score.away_games.realized.to_a
  end

  def games
    @games ||= home_games + away_games
  end

  def wins
    @wins ||= home_games.count { |r| r.home_goals > r.away_goals } +
              away_games.count { |r| r.home_goals < r.away_goals }
  end

  def draws
    @draws ||= games.count { |r| r.home_goals == r.away_goals }
  end

  def loses
    @loses = games.count - (wins + draws)
  end

  def gp
    @gp ||= home_games.sum(&:home_goals) + away_games.sum(&:away_goals)
  end

  def gc
    @gc ||= home_games.sum(&:away_goals) + away_games.sum(&:home_goals)
  end

  def update
    score.games = games.count
    score.points = (wins * 3) + draws
    score.wins = wins
    score.draws = draws
    score.loses = loses
    score.gp = gp
    score.gc = gc

    score.save!
  end
end