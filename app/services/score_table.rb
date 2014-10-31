class ScoreTable
  def self.update(game)
    new(game).update
  end

  attr_reader :game

  delegate :home_player, :away_player, :home_goals, :away_goals,  to: :game

  def initialize(game)
    @game = game
  end

  def home_player_score
    @home_player_score ||= home_player.score || home_player.build_score
  end

  def away_player_score
    @away_player_score ||= away_player.score || away_player.build_score
  end


  def update
    if home_goals > away_goals
      home_player_score.points += 3
      home_player_score.wins += 1
      away_player_score.loses += 1
    elsif home_goals < away_goals
      away_player_score.points += 3
      away_player_score.wins += 1
      home_player_score.loses += 1
    else
      home_player_score.points += 1
      away_player_score.points += 1
      home_player_score.draws += 1
      away_player_score.draws += 1
    end

    home_player_score.games += 1
    home_player_score.gp += home_goals
    home_player_score.gc += away_goals

    away_player_score.games += 1
    away_player_score.gp += away_goals
    away_player_score.gc += home_goals

    ActiveRecord::Base.transaction do
      home_player_score.save!
      away_player_score.save!
    end
  end
end